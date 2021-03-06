import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _Keys {
  static const userName = 'user_name';
}

@Injectable()
class UserDataProvider {
  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_Keys.userName);
  }

  Future<void> setUserName(String? userName) async {
    final prefs = await SharedPreferences.getInstance();
    if (userName != null) {
      prefs.setString(_Keys.userName, userName);
    } else {
      prefs.remove(_Keys.userName);
    }
  }
}
