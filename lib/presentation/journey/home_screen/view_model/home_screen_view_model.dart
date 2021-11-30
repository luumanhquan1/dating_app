
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';

import 'package:dating_app/domain/usecase/home_usecase.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  // final HomeUseCase useCase;
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

 void dispose() {
   _getListUser.close();
  }
}
