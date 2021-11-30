

import 'package:dating_app/common/extension/map_extension.dart';

class UserModel {
  String id='';
   String msv='';
  String hoTen='';
  String gender='';
  String ngaySinh='';
  int age=0;
  List<ListImg> listImg = [];

  UserModel({
    required this.id,
    required this.msv,
    required this.hoTen,
    required this.gender,
    required this.ngaySinh,
    required this.age,
  });
  // required this.listImg});

 UserModel.fromJson(Map<String, dynamic> json) {
    id = json.stringValueOrEmpty('id');
    msv = json.stringValueOrEmpty('msv');
    hoTen = json.stringValueOrEmpty('hoTen');
    gender = json.stringValueOrEmpty('gender');
    ngaySinh = json.stringValueOrEmpty('ngaySinh');
    age = json.intValue('age');
    if (json['listImg'] != null) {
      json['listImg'].forEach((v) {
        listImg.add(ListImg.fromJson(v));
      });
    }
  }
}

class ListImg {
  String? idImg;
  String? url;

  ListImg({required this.idImg, required this.url});

  ListImg.fromJson(Map<String, dynamic> json) {
    idImg = json.stringValueOrEmpty('idImg');
    url = json.stringValueOrEmpty('url');
  }
}
