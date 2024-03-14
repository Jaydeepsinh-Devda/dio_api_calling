import 'package:api_calling_demo/view/post_method/bloc/post_method_bloc.dart';
import 'package:api_calling_demo/view/post_method/bloc/post_method_event.dart';
import 'package:api_calling_demo/view/post_method/bloc/post_method_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostMethodScreen extends StatefulWidget {
  const PostMethodScreen({super.key});

  @override
  State<PostMethodScreen> createState() => _PostMethodScreenState();
}

class _PostMethodScreenState extends State<PostMethodScreen> {
  final TextEditingController _nameController = TextEditingController();

  late PostMethodBloc _bloc;
  String _name = "Hello";
  int _statusCode = 100;

  @override
  void initState() {
    _bloc = context.read<PostMethodBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Method Demo"),
      ),
      body: BlocBuilder<PostMethodBloc, PostMethodState>(
        builder: (context, state) {
          if (state is OnGetPostModelSuccessState) {
            _name = state.data;
          }
          if (state is OnPatchRequestSuccessState) {
            _statusCode = state.statusCode;
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text("Enter Name"),
                _textField(),
                _button(),
                state is OnGetPostModalLoadingState
                    ? _loadingIndicator()
                    : _text(_name),
                _text("Patch Request Demo"),
                _patchRequestButton(),
                state is OnPatchRequestLoadingState
                    ? _loadingIndicator()
                    : _text("StatusCode: $_statusCode")
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _loadingIndicator() => const CircularProgressIndicator();

  Widget _patchRequestButton() => ElevatedButton(
        onPressed: () {
          _bloc.add(GetPatchRequestEvent());
        },
        child: _text("Patch Request"),
      );

  Widget _text(String name) => Text(name);

  Widget _textField() => TextField(
        controller: _nameController,
      );

  Widget _button() => ElevatedButton(
        onPressed: _onPressed,
        child: const Text("POST Request"),
      );

  void _onPressed() => _bloc.add(GetPostModelEvent(name: _nameController.text));
}
