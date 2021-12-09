import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Constant/shared_preferences_keys.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/helper/user_share_preferences.dart';
import 'package:dating_app/domain/usecase/login_usecase.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';

class LoginViewModel {
  LoginUseCase get useCase => getIt<LoginUseCase>();
  AppStateViewModel appStateViewModel;
  LoginViewModel(this.appStateViewModel);
  Future<void> login(String user, String pass) async {
    final data = await useCase.login(user, pass);
    if (data.hasData) {
      await UserDefault()
          .setString(SharedPreferencesKeys.AUTH_TOKEN, data.data ?? '');
      appStateViewModel.accessToken.sink.add(data.data ?? '');
    }
  }
}
