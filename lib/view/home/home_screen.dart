import 'package:api_calling_demo/models/posts_model.dart';
import 'package:api_calling_demo/view/bloc/home_bloc.dart';
import 'package:api_calling_demo/view/bloc/home_event.dart';
import 'package:api_calling_demo/view/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  List<PostsModel> _list = [];

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();
    _bloc.add(GetPostListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Calling"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is OnPostsLoadedState) {
            _list = state.list;
          }
          return state is OnPostsLoadingState
              ? _loadingIndicator()
              : _listView(_list);
        },
      ),
    );
  }

  Widget _loadingIndicator() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _listView(List<PostsModel> list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(list[index].title.toString()),
          );
        },
      );
}
