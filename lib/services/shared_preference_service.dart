import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  addStringToSharedPref(String key, String value) async {
    var sharedPreferenceInstance = await SharedPreferences.getInstance();
    await sharedPreferenceInstance.setString(key, value);
  }

  Future<String> getStringFromSharedPref(String key) async {
    var sharedPreferenceInstance = await SharedPreferences.getInstance();

    return sharedPreferenceInstance.getString(key);
  }

  Future<bool> sharedPrefrefContainsKey(String key) async {
    var sharedPreferenceInstance = await SharedPreferences.getInstance();
    return sharedPreferenceInstance.containsKey(key);
  }

  Future<bool> clearData() async {
    var sharedPreferenceInstance = await SharedPreferences.getInstance();
    return await sharedPreferenceInstance.clear();
  }
}
