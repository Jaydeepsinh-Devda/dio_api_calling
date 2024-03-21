import "package:api_calling_demo/core/app_config.dart";
import "package:api_calling_demo/core/util/logger.dart";
import "package:api_calling_demo/core/webservice/api_client.dart";
import "package:api_calling_demo/my_app/my_app_page.dart";
import "package:flutter/material.dart";
import 'package:api_calling_demo/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
}

void _init() async {
  loggerConfig();
  await di.init();

  await Firebase.initializeApp();

  bool isAppConfigured = await AppConfig.configure();

  if (isAppConfigured) {
    ApiClient.initServices();
    debugPrint("BaseUrl Taken: ${AppConfig.getInstance().apiBaseUrl}");
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
