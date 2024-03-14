import 'package:api_calling_demo/models/posts_model.dart';
import 'package:api_calling_demo/view/home/bloc/home_bloc.dart';
import 'package:api_calling_demo/view/home/bloc/home_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_state.dart';
import 'package:api_calling_demo/view/post_method/screen/post_method_page.dart';
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
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();
    _bloc.add(GetPostListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is OnPostsLoadedState) {
            _list = state.list;
          }
          return CustomScrollView(
            slivers: [
              _sliverToBoxAdapter(),
              state is OnPostsLoadingState ? _loadingIndicator() : _listView(),
            ],
          );
        },
      ),
    );
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        title: _text("API Calling"),
        actions: [
          IconButton(
            onPressed: _navigatePostMethodScreen,
            icon: const Icon(Icons.arrow_circle_right_outlined),
          )
        ],
      );

  Widget _sliverToBoxAdapter() => SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text("Enter User Id"),
              _textField(),
              _button(),
            ],
          ),
        ),
      );

  Widget _button() => Center(
        child: ElevatedButton(
          onPressed: () {
            int userId = int.parse(_userIdController.text);
            _bloc.add(GetPostByUserID(userId: userId));
          },
          child: _text("Click"),
        ),
      );

  Widget _textField() => TextField(
        controller: _userIdController,
      );

  Widget _text(String text) => Text(text);

  Widget _loadingIndicator() => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  Widget _listView() => SliverList.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.abc),
            title: Text(_list[index].title.toString()),
          );
        },
      );

  // Widget _leading(int index) => CircleAvatar(
  //       backgroundImage: NetworkImage(_list[index].avatar),
  //     );

  void _navigatePostMethodScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const PostMethodPage()));
  }
}
