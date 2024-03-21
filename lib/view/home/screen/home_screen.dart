import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/models/user_model.dart';
import 'package:api_calling_demo/view/home/bloc/home_bloc.dart';
import 'package:api_calling_demo/view/home/bloc/home_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_state.dart';
import 'package:api_calling_demo/view/home/widgets/drawer_widget.dart';
import 'package:api_calling_demo/view/home/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  List<Datum> _list = [];

  //! Widget Lifecycle Method
  @override
  void initState() {
    _bloc = context.read<HomeBloc>();
    _bloc.add(GetUsersListEvent());
    super.initState();
  }

  //! Build Method
  @override
  Widget build(BuildContext context) {
    return _blocConsumer();
  }

  //! Widget Methods
  Widget _blocConsumer() => BlocConsumer<HomeBloc, HomeState>(
        listener: _listener,
        builder: _builder,
      );

  Widget _builder(BuildContext context, HomeState state) {
    if (state is OnUsersListLoadedState) {
      _list = state.list;
    }
    return Scaffold(
      appBar: _appBar(),
      body: _buildScaffoldBody(state),
      drawer: _drawerWidget(),
    );
  }

  HomeScreenAppBar _appBar() => const HomeScreenAppBar();

  Widget _drawerWidget() => DrawerWidget(
        onLogoutButtonPressed: _onLogoutButtonPressed,
      );

  Widget _buildScaffoldBody(HomeState state) =>
      state is HomeLoadingState ? _loadingIndicator() : _container();

  Widget _container() => Container(
        margin: EdgeInsets.symmetric(horizontal: PointSize.value20),
        child: _listViewBuilder(),
      );

  Widget _loadingIndicator() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _listViewBuilder() => ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _listTile(index);
        },
      );

  Widget _listTile(int index) => ListTile(
        leading: _circularProfileImage(index),
        title: _usersEmailId(index),
      );

  Widget _usersEmailId(int index) => Text(_list[index].firstName.toString());

  Widget _circularProfileImage(int index) => CircleAvatar(
        backgroundImage: NetworkImage(_list[index].avatar),
      );

  //! Listener
  void _listener(BuildContext context, HomeState state) {
    if (state is HomeErrorState) {
      _errorSnackbar(state.error);
    }
  }

  //! Function
  void _onLogoutButtonPressed() {
    _bloc.add(LogoutButtonPressedEvent());
  }

  void _errorSnackbar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error),
      ),
    );
  }
}
