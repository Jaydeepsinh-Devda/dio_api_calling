import 'package:api_calling_demo/injection_container.dart';
import 'package:api_calling_demo/view/home/bloc/home_bloc.dart';
import 'package:api_calling_demo/view/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static String tag = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<HomeBloc>(),
      child: const HomeScreen(),
    );
  }
}
