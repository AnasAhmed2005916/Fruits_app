import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  SharedPreferencesSingleton._();

  static final SharedPreferencesSingleton instance =
      SharedPreferencesSingleton._();

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? getString(String key) => _preferences.getString(key);

  Future<bool> setString(String key, String value) =>
      _preferences.setString(key, value);

  bool? getBool(String key) => _preferences.getBool(key);

  Future<bool> setBool(String key, bool value) =>
      _preferences.setBool(key, value);

  int? getInt(String key) => _preferences.getInt(key);

  Future<bool> setInt(String key, int value) => _preferences.setInt(key, value);

  Future<bool> remove(String key) => _preferences.remove(key);

  Future<bool> clear() => _preferences.clear();
}
