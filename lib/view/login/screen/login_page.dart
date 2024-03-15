import 'package:api_calling_demo/injection_container.dart';
import 'package:api_calling_demo/view/login/bloc/login_bloc.dart';
import 'package:api_calling_demo/view/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static String tag = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => serviceLocator<LoginBloc>(),
        child: const LoginScreen(),
      ),
    );
  }
}
