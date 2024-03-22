import 'package:api_calling_demo/core/constant/profiles.dart';
import 'package:api_calling_demo/core/util/logger.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/util/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum Environment { develop, production, stage }

class AppConfig {
  Environment flavor;
  final String apiBaseUrl;

  AppConfig({required this.flavor, required this.apiBaseUrl});

  static late AppConfig _instance;

  static Future<bool> configure() async {
    try {
      final String? flavor = await (MethodChannel(MyAppStrings.channel.kApp)
          .invokeMethod<String>(MyAppStrings.channelMethod.kFlavor));
      if (flavor != null) {
        log.info('STARTED WITH FLAVOR $flavor');
        _setUpEnvironment(Utilities.enumFromString(flavor, Environment.values));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static void _setUpEnvironment(Environment flavorName) {
    late String baseUrl;
    late Environment flavor;
    if (flavorName == Environment.develop) {
      baseUrl = Profiles.developProfile.baseUrl;
      flavor = flavorName;
    } else if (flavorName == Environment.production) {
      baseUrl = Profiles.productionProfile.basUrl;
      flavor = flavorName;
    } else if (flavorName == Environment.stage) {
      baseUrl = Profiles.developProfile.baseUrl;
      flavor = flavorName;
    }
    _instance = AppConfig(flavor: flavor, apiBaseUrl: baseUrl);
    log.info('APP CONFIGURED FOR: $flavorName');
  }

  static AppConfig getInstance() => _instance;
}
