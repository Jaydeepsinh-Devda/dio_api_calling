import 'package:api_calling_demo/core/shared_preference_manager.dart';

const String token = 'token';

class SharedPreferencesHelper {
  static SharedPreferenceManager prefs = SharedPreferenceManager();

  static Future<String?> getToken() async {
    return prefs.getToken(token);
  }

  static Future<bool> setToken(String value) async {
    return await prefs.setToken(token, value);
  }

   static Future<bool?> clear() async {
    return await prefs.clear();
  }
}
