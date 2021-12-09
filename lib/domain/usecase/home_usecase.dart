
import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/domain/repositories/home_repositories.dart';
import 'package:dating_app/presentation/journey/home_screen/view_model/home_screen_view_model.dart';

class HomeUseCase{
  HomeRepositories homeRepositories;
  HomeUseCase(this.homeRepositories);
 Future<DataChanel<String,List<UserModel>>> getListUserRemote(){
    return homeRepositories.getListUser();
  }
  Future<void> thichUserRemote(String id,{onTrangThai? trangThai}) async {
    Map<String,dynamic> data={'id':id};
    if(trangThai!=null){
      int trangThaiJson=0;
      switch(trangThai){
        case onTrangThai.tym:
          trangThaiJson=0;
          break;
        case onTrangThai.superLike:
          trangThaiJson=1;
          break;
        case onTrangThai.close:
          break;
      }
      data['trangThai']=trangThaiJson;
     await homeRepositories.thichUser(data);
    }
  }
}