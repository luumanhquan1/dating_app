import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/domain/repositories/login_repositories.dart';

class LoginUseCase{
 final LoginRepositories loginRepositories;
 LoginUseCase(this.loginRepositories);
 Future<DataChanel<String, String>> login(String userName,String pass) async{
   Map<String,dynamic> param={
     'username':userName,
     'password':pass
   };
  return loginRepositories.login(param);
 }
}