import "package:api_calling_demo/core/webservice/api_client.dart";
import "package:api_calling_demo/my_app/my_app_page.dart";
import "package:flutter/material.dart";
import 'package:api_calling_demo/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init(); 
}

void _init() async {
  await di.init();
  ApiClient.initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}
