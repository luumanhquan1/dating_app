import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Support/data_chanel.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:dating_app/common/extension/map_extension.dart';

class LoginService {
  final ApiClient apiClient;
  LoginService(this.apiClient);
  Future<DataChanel<String, String>> login(dynamic param) async {
    try {
      final responsive = await apiClient.post('/auth/login', param);
      Map<String, dynamic> jsonData = responsive.data as Map<String, dynamic>;
      if (jsonData['isSuccess']) {
        String token = jsonData.stringValueOrEmpty('token');
        return DataChanel.data(token);
      } else {
        return DataChanel.error(jsonData.arrayValueOrEmpty('Messages').first);
      }
    } catch (err) {
      return DataChanel.error(err.toString());
    }
  }
}
