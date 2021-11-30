import 'dart:developer';


import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:dating_app/common/extension/map_extension.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
class HomeService{
  final ApiClient apiClient;
  HomeService(this.apiClient);
  Future<DataChanel<String,List<UserModel>>> getListUserRemote() async {
    try{
      final res=await apiClient.get('/api/user/get-list-user', {});
      Map<String,dynamic> jsonData=res.data as Map<String,dynamic>;
      if(jsonData['isSuccess']){
        List<UserModel> listUser=[];
        List<dynamic> data=jsonData.arrayValueOrEmpty('Data');
        for(var vl in data){
          listUser.add(UserModel.fromJson(vl));
        }
        return DataChanel.data(listUser);
      }else{
        return DataChanel.error(jsonData['Messages'].toString());
      }
    }catch(err){
      return DataChanel.error(err.toString());
    }
  }
}