import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/data/remote_data/profile_service.dart';
import 'package:dating_app/domain/repositories/profile_repositories.dart';

class ProfileRepositoriesImpl extends ProfileRepositories{
  final ProfileService service;
  ProfileRepositoriesImpl(this.service);
  @override
  Future<DataChanel<String, UserModel>> getInfoUser(String id) {
        return service.getProfileUser(id);
  }

}