import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _homePageScreenTitle(),
    );
  }

  Widget _homePageScreenTitle() => Text(MyAppStrings.screenTitle.kHomePage);
  
  @override
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
