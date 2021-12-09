import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/domain/usecase/profile_use_case.dart';
import 'package:rxdart/rxdart.dart';

class ProfileViewModel {
  ProfileUseCase get useCase => getIt<ProfileUseCase>();
  final BehaviorSubject<UserModel> _getUserProfile =
      BehaviorSubject<UserModel>();

  Stream<UserModel> get getUserProfile => _getUserProfile.stream;

  Future<void> getProfile(String id) async {
    final data = await useCase.getInfoUser(id);
    if (data.hasData) {
      _getUserProfile.sink.add(data.data ?? UserModel.fromJson({}));
    }
  }

  dispose() {
    _getUserProfile.close();
  }
}
