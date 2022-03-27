
import 'package:demobloc/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<bool> saveUser(UserModel? user);

  UserModel? getUser();

  Future<bool> clearUser();
}

class SharedPrefStorage extends LocalStorage {
  final SharedPreferences prefs;

  SharedPrefStorage(this.prefs);

  /// Initialize shared pref
  static Future<LocalStorage> init() async =>
      SharedPrefStorage(await SharedPreferences.getInstance());

  /// Save user here
  @override
  Future<bool> saveUser(UserModel? user) async {
    return await prefs.setString("USER_DATA", user!.toJson());
  }

  @override
  UserModel? getUser() {
    final user = prefs.getString(
      "USER_DATA",
    );
    if (user != null) {
      return UserModel.fromJson(user);
    }
  }

  @override
  Future<bool> clearUser() async {
    return await prefs.remove("USER_DATA") ;
  }
}
