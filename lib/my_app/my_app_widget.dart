import 'package:api_calling_demo/view/authentication/autehentication_state.dart';
import 'package:api_calling_demo/view/authentication/authentication_bloc.dart';
import 'package:api_calling_demo/view/home/screen/home_page.dart';
import 'package:api_calling_demo/view/login/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({super.key});

  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  late AuthenticationBloc _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthenticationBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp() => MaterialApp(
        home: __blocBuilder(),
      );

  Widget __blocBuilder() =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: _builder);

  Widget _builder(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationAuthenticated) {
      print("Home Page");
      return const HomePage();
    } else if (state is AuthenticationUnauthenticated) {
      print("Login Page");
      return const LoginPage();
    }
    return const LoginPage();
  }
}
