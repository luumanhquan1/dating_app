import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/domain/repositories/profile_repositories.dart';

class ProfileUseCase{
  final ProfileRepositories _repositories;
  ProfileUseCase(this._repositories);
  Future<DataChanel<String,UserModel>> getInfoUser(String id){
    return _repositories.getInfoUser(id);
  }
}