import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';

abstract class ProfileRepositories{
  Future<DataChanel<String,UserModel>> getInfoUser(String id);
}