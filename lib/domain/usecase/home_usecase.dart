
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/domain/repositories/home_repositories.dart';

class HomeUseCase{
  HomeRepositories homeRepositories;
  HomeUseCase(this.homeRepositories);
 Future<DataChanel<String,List<UserModel>>> getListUserRemote(){
    return homeRepositories.getListUser();
  }
}