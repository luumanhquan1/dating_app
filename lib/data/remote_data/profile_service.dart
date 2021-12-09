import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/common/extension/map_extension.dart';
class ProfileService {
  final ApiClient apiClient;
  ProfileService(this.apiClient);
  Future<DataChanel<String, UserModel>> getProfileUser(String id) async {
    try {
      final responsive = await apiClient.post(
          '/api/user/get-user', {'id': id});
      Map<String,dynamic> jsonData=responsive.data as Map<String,dynamic>;
      if(jsonData['isSuccess']){
        final data=jsonData.mapValueOrEmpty('Data');
        return DataChanel.data(UserModel.fromJson(data));
      }
      return DataChanel.error(jsonData['Messages'].toString());
    } catch (err) {
      return DataChanel.error(err.toString());
    }
  }
}
