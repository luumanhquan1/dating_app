
import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';

import 'package:dating_app/domain/usecase/home_usecase.dart';
import 'package:rxdart/rxdart.dart';
enum onTrangThai{close,tym,superLike}
class HomeViewModel {

   HomeUseCase get useCase=>getIt<HomeUseCase>();

   BehaviorSubject<List<UserModel>> _getListUser = BehaviorSubject<List<UserModel>>();

  Stream<List<UserModel>> get getListUserBloc => _getListUser.stream;

  Future<void> getListUser() async {
    final result = await useCase.getListUserRemote();
    if (result.hasData) {
      final data=result.data??[];

      _getListUser.sink.add(data);
    }
  }
  void thaoTacUser(String id,{onTrangThai? trangThai}){
     useCase.thichUserRemote(id,trangThai: trangThai);
  }
 void dispose() {
   _getListUser.close();
  }
}
