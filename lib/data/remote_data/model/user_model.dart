import 'package:dating_app/common/extension/map_extension.dart';

class UserModel {
  String id = '';
  String msv = '';
  String hoTen = '';
  String gender = '';
  String ngaySinh = '';
  int age = 0;
  String anhDaiDien='';
  List<ListImg> listImg = [];
  List<ListSoThich> listSoThich = [];
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
    anhDaiDien=json.stringValueOrEmpty('anhDaiDien');
    if (json['listImg'] != null) {
      json['listImg'].forEach((v) {
        listImg.add(ListImg.fromJson(v));
      });
    }
    if (json['listSoThich'] != null) {
      json['listSoThich'].forEach((v) {
        listSoThich.add(ListSoThich.fromJson(v));
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

class ListSoThich {
  String? idSoThich;
  String? name;
  String? url;
  bool isSoThich=false;

  ListSoThich({this.idSoThich, this.name, this.url, required this.isSoThich});

  ListSoThich.fromJson(Map<String, dynamic> json) {
    idSoThich = json.stringValueOrEmpty('idSoThich');
    name = json.stringValueOrEmpty('name');
    url = json.stringValueOrEmpty('url');
    isSoThich = json.boolValue('isSoThich');
  }
}
