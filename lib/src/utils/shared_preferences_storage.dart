import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferencesStorage{

  final SharedPreferences _sharedPreferences;
  static const String accessToken = "ACCESS_TOKEN";
  SharedPreferencesStorage(this._sharedPreferences);

  String? get oAuthToken => _sharedPreferences.getString(accessToken);

  Future<void> setAuthToken(String? token) async {
    await _sharedPreferences.setString(accessToken, token!);
  }

}