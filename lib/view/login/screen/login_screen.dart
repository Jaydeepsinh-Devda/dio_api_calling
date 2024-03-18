import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/screen_title.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/gen/assets.gen.dart';
import 'package:api_calling_demo/ui_components/custom_button/custom_button.dart';
import 'package:api_calling_demo/ui_components/custom_scroll_widget/custom_scroll_widget.dart';
import 'package:api_calling_demo/view/login/bloc/login_bloc.dart';
import 'package:api_calling_demo/view/login/bloc/login_event.dart';
import 'package:api_calling_demo/view/login/bloc/login_state.dart';
import 'package:api_calling_demo/view/login/widgets/login_form_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // late String response;

  //! Widget Lifecycle Method
  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  //! Build Method
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _listener,
      builder: _builder,
    );
  }

  //! Widget Methods

  Widget _builder(BuildContext context, LoginState state) => Scaffold(
        body: _buildScaffoldBody(state),
      );

  Widget _buildScaffoldBody(LoginState state) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 1,
            image: AssetImage(Assets.images.loginPageBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PointSize.value20),
          child: SafeArea(
            child: _customScrollWidget(state),
          ),
        ),
      );

  Widget _customScrollWidget(LoginState state) => CustomScrollWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _loginTitleAndGreetingText(),
            _loginForm(),
            _loginButton(state),
          ],
        ),
      );

  Widget _loginTitleAndGreetingText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loginTitle(),
          _greetingText(),
        ],
      );

  Widget _loginTitle() => Text(
        ScreenTitle().kLogin,
        style: TextStyle(
          fontSize: PointSize.large,
          color: Colors.white,
        ),
      );

  Widget _greetingText() => Text(
        Strings.greetingString.kWelcomeBack,
        style: TextStyle(
          fontSize: PointSize.h1,
          color: Colors.white,
        ),
      );

  Widget _loginForm() => Form(
        key: _formKey,
        child: LoginFormColumn(
          onFieldSubmitted: (_) => _onPasswordFieldSubmitted(),
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      );

  Widget _loginButton(LoginState state) => CustomButton(
        state: state,
        onLoginButtonPressed: _onLoginButtonPressed,
      );

  //! Listener
  void _listener(BuildContext context, LoginState state) {
    if (state is LoginFailureState) {
      _errorSnackbar(state.error);
    }
  }

  //! Functions
  void _onLoginButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _loginBloc.add(
        LoginButtonClickedEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  void _errorSnackbar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error),
      ),
    );
  }

  void _onPasswordFieldSubmitted() {
    _onLoginButtonPressed();
  }
}
