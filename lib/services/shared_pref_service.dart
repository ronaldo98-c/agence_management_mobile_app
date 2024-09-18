import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_mobile/screens/home.dart';

class SharedPrefService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void userLog({String? email, String? token, int? id}) async {
    SharedPreferences pref = await _prefs;
    pref.setBool("login", true);
    pref.setString("email", email ?? "email");
    pref.setInt("id", id ?? 0);
    pref.setString("token", token ?? "");
  }

  Future<String> start() async {
    SharedPreferences pref = await _prefs;

    var status = pref.getString("email");
    if (status == null) {
      pref.setBool("login", false);
    }

    return status != null ? HomeScreen.routeName : HomeScreen.routeName;
  }

  Future<Map<String, dynamic>> getUser() async {
    SharedPreferences pref = await _prefs;

    // ? simulate delay
    await Future.delayed(const Duration(seconds: 0));
    var user = Future.value({
      "user": pref.getInt("id"),
      "email": pref.getString("email"),
    });

    return user;
  }

  void clear() async {
    SharedPreferences pref = await _prefs;
    pref.setBool("login", false);
    pref.remove("email");
    pref.remove("id");
  }
}