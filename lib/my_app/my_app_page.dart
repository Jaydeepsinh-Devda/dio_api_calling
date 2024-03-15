import 'package:api_calling_demo/injection_container.dart';
import 'package:api_calling_demo/my_app/my_app_widget.dart';
import 'package:api_calling_demo/view/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AuthenticationBloc>(),
      child: const MyAppWidget(),
    );
  }
}
