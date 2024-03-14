import "package:api_calling_demo/core/webservice/api_client.dart";
import 'package:api_calling_demo/view/home/screen/home_page.dart';
import "package:flutter/material.dart";

void main() async {
  _init();
  runApp(const MyApp());
}

void _init() {
  ApiClient.initServices();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
