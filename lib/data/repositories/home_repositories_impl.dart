
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/home_service.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories{
  final HomeService homeService;
  HomeRepositoriesImpl(this.homeService);
  @override
  Future<DataChanel<String, List<UserModel>>> getListUser() {
        return homeService.getListUserRemote();
  }

  @override
  Future<void> thichUser(Map<String, dynamic> data) async {
   await homeService.thichUser(data);
  }



}