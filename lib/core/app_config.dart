import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:flutter/services.dart';

enum Environment { develop, stage, mock, production }

class AppConfig {
  Environment flavor;
  final String apiBaseUrl;

  AppConfig({required this.flavor, required this.apiBaseUrl});


  static Future<bool> configure() async {
    try {
      final String? flavor = await (MethodChannel(Strings.channel.kApp)
          .invokeMethod<String>(Strings.channelMethod.kFlavor));
      if (flavor != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
