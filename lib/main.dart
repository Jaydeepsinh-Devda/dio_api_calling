import "package:api_calling_demo/core/app_config.dart";
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

  bool isAppConfigured = await AppConfig.configure();

  if (isAppConfigured) {
    runApp(const MyApp());
  } else {
    runApp(_defaultApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}

Widget _defaultApp() => MaterialApp(
      home: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "No able to find app, Please restart the app",
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
