import 'package:api_calling_demo/view/post_method/bloc/post_method_bloc.dart';
import 'package:api_calling_demo/view/post_method/screen/post_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostMethodPage extends StatelessWidget {
  const PostMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostMethodBloc>(
      create: (context) => PostMethodBloc(),
      child: const PostMethodScreen(),
    );
  }
}
