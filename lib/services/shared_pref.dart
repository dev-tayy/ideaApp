import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final String usernameKey = 'usernameKey';
  static final String emailKey = 'emailKey';
  static Future<bool> saveUsername(String username) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(usernameKey, username);
  }

  static Future<bool> saveEmail(String email) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(emailKey, email);
  }

  static Future<void> getUsername() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(usernameKey);
  }

  static Future<void> getEmail() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(emailKey);
  }
}
