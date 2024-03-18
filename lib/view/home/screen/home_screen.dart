import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/models/user_model.dart';
import 'package:api_calling_demo/view/home/bloc/home_bloc.dart';
import 'package:api_calling_demo/view/home/bloc/home_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_state.dart';
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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _listener,
      builder: _builder,
    );
  }

  //! Widget Methods
  AppBar _appBar() => AppBar(
        centerTitle: true,
        title: _homePageScreenTitle(),
      );

  Widget _homePageScreenTitle() => Text(Strings.screenTitle.kHomePage);

  Widget _builder(BuildContext context, HomeState state) {
    if (state is OnUsersListLoadedState) {
      _list = state.list;
    }
    return Scaffold(
      appBar: _appBar(),
      body: _buildScaffoldBody(state),
      drawer: _drawer(),
    );
  }

  Widget _drawer() => Drawer(
        child: Column(
          children: [
            _drawerHeader(),
            _logoutButtonRow(),
          ],
        ),
      );

  Widget _logoutButtonRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logoutIcon(),
          _logoutButton(),
        ],
      );

  Widget _drawerHeader() => const DrawerHeader(
        child: Text("Header"),
      );

  Widget _logoutIcon() => const Icon(
        Icons.logout,
        color: Colors.green,
      );

  Widget _logoutButton() => TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed: _onLogoutButtonPressed,
        child: Text(Strings.button.kLogout),
      );

  Widget _buildScaffoldBody(HomeState state) => state is HomeLoadingState
      ? _loadingIndicator()
      : Container(
          margin: EdgeInsets.symmetric(horizontal: PointSize.value20),
          child: CustomScrollView(
            slivers: [
              _listView(),
            ],
          ),
        );

  Widget _loadingIndicator() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _listView() => SliverList.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _circularProfileImage(index),
            title: _usersEmailId(index),
          );
        },
      );

  Widget _usersEmailId(int index) => Text(_list[index].email.toString());

  Widget _circularProfileImage(int index) => CircleAvatar(
        backgroundImage: NetworkImage(_list[index].avatar),
      );

  //! Listener
  void _listener(BuildContext context, HomeState state) {}

  //! Function
  void _onLogoutButtonPressed() {
    _bloc.add(LogoutButtonPressedEvent());
  }
}
