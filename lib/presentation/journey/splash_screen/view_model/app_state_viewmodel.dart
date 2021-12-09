import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Constant/shared_preferences_keys.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/helper/user_share_preferences.dart';

import 'package:rxdart/rxdart.dart';

class AppStateViewModel {

  final BehaviorSubject<String> accessToken = BehaviorSubject<String>();
  final BehaviorSubject<String> refreshToken = BehaviorSubject<String>();
  Future<String> getAccessToken() async {
    final token =await UserDefault().getString(SharedPreferencesKeys.AUTH_TOKEN);
    accessToken.sink.add(token);
    return token;
  }

  Future<void> refeshToken(String token) async {
    UserDefault().setString(SharedPreferencesKeys.AUTH_TOKEN, token);
    refreshToken.sink.add(token);
  }

  void dispose() {
    accessToken.close();
    refreshToken.close();
  }
}
