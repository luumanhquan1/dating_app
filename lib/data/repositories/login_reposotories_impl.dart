import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/login_service.dart';
import 'package:dating_app/domain/repositories/login_repositories.dart';

class LoginRepositoriesImpl extends LoginRepositories{
   final LoginService loginService;
   LoginRepositoriesImpl(this.loginService);
  @override
  Future<DataChanel<String, String>> login(dynamic param) {
    return loginService.login(param);
  }

}