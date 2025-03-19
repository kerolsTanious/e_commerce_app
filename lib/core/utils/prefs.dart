import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKeys {
  name,
  mobileNumber,
  email,
  password,
  customerId,
}

class PrefsHelper {
  static late SharedPreferences prefs;

  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setToken({required String token}) {
    prefs.setString("token", token);
  }

  static String getToken() {
    return prefs.getString("token") ?? "";
  }

  static removeToken() {
    prefs.remove("token");
  }

  static setString({required PrefsKeys key, required String value}) {
    prefs.setString(key.name, value);
  }

  static getString({required PrefsKeys key}) {
    return prefs.get(key.name);
  }

  static removeString({required PrefsKeys key}) {
    prefs.remove(key.name);
  }
}
