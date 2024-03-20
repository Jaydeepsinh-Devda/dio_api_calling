import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onLogoutButtonPressed;
  const DrawerWidget({
    required this.onLogoutButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _drawerHeader(),
          _logoutButtonRow(),
        ],
      ),
    );
  }

  //! Widget Methods
  Widget _drawerHeader() => const DrawerHeader(
        child: Icon(Icons.person),
      );

  Widget _logoutButtonRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logoutIcon(),
          _logoutButton(),
        ],
      );

  Widget _logoutIcon() => const Icon(
        Icons.logout,
        color: Colors.green,
      );

  Widget _logoutButton() => TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: onLogoutButtonPressed,
        child: Text(MyAppStrings.button.kLogout),
      );
}
