// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// *************************************
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/common/helper/user_share_preferences.dart';
import 'package:dating_app/data/remote_data/home_service.dart';
import 'package:dating_app/data/remote_data/login_service.dart';
import 'package:dating_app/data/remote_data/profile_service.dart';
import 'package:dating_app/data/repositories/home_repositories_impl.dart';
import 'package:dating_app/data/repositories/login_reposotories_impl.dart';
import 'package:dating_app/data/repositories/profile_repositories_impl.dart';
import 'package:dating_app/domain/repositories/home_repositories.dart';
import 'package:dating_app/domain/repositories/login_repositories.dart';
import 'package:dating_app/domain/repositories/profile_repositories.dart';
import 'package:dating_app/domain/usecase/home_usecase.dart';
import 'package:dating_app/domain/usecase/login_usecase.dart';
import 'package:dating_app/domain/usecase/profile_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:logger/logger.dart';

import 'dio_di.dart';
import 'logger_di.dart';

Future<void> $initGetIt(GetIt g, {required String environment}) async {
  final _$LoggerDi loggerDi = _$LoggerDi();
  final _$DioDi dioDi = _$DioDi();
  g.registerLazySingleton<Logger>(() => loggerDi.logger);
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  g.registerLazySingleton<ApiClient>(() => ApiClient(g<Dio>()));
  g.registerLazySingleton<SocketClient>(() => SocketClient());
  service(g);
  repositories(g);
  useCase(g);
}

void service(GetIt g) {
  ApiClient apiClient=g<ApiClient>();
  g.registerLazySingleton<HomeService>(() => HomeService(apiClient));
  g.registerLazySingleton<ProfileService>(() => ProfileService(apiClient));
  g.registerLazySingleton<LoginService>(() => LoginService(apiClient));
}

void repositories(GetIt g) {
  g.registerLazySingleton<ProfileRepositories>(
      () => ProfileRepositoriesImpl(g<ProfileService>()));
  g.registerLazySingleton<HomeRepositories>(
      () => HomeRepositoriesImpl(g<HomeService>()));
  g.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(g<LoginService>()));
}

void useCase(GetIt g) {
  g.registerFactory<ProfileUseCase>(
      () => ProfileUseCase(g<ProfileRepositories>()));
  g.registerFactory<HomeUseCase>(() => HomeUseCase(g<HomeRepositories>()));
  g.registerFactory<LoginUseCase>(() => LoginUseCase(g<LoginRepositories>()));
}

class _$LoggerDi extends LoggerDi {}

class _$DioDi extends DioDi {}
