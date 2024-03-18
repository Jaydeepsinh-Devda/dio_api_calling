import 'package:api_calling_demo/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  SharedPreferenceManager._();

  static final SharedPreferenceManager _instance = SharedPreferenceManager._();

  factory SharedPreferenceManager() => _instance;

  final SharedPreferences _prefs = serviceLocator<SharedPreferences>();

  Future<bool> setToken(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getToken(String key) {
    return _prefs.getString(key);
  }

  Future<bool?> clear() async => await _prefs.clear();
}
