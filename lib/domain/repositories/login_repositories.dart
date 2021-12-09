import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';

abstract class LoginRepositories{
  Future<DataChanel<String,String>> login(dynamic param);
}