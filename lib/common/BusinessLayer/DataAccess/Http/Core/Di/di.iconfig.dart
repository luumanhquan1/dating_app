// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// *************************************
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:dating_app/data/remote_data/home_service.dart';
import 'package:dating_app/data/repositories/home_repositories_impl.dart';
import 'package:dating_app/domain/repositories/home_repositories.dart';
import 'package:dating_app/domain/usecase/home_usecase.dart';
import 'package:dating_app/presentation/journey/home_screen/home_screen.dart';
import 'package:dating_app/presentation/journey/home_screen/view_model/home_screen_view_model.dart';
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
  service(g);
  repositories(g);
  useCase(g);

}
void service(GetIt g){
  g.registerLazySingleton<HomeService>(() => HomeService(g<ApiClient>()));
}
void repositories(GetIt g){
  g.registerLazySingleton<HomeRepositories>(() => HomeRepositoriesImpl(g<HomeService>()));
}
void useCase(GetIt g){
  g.registerFactory<HomeUseCase>(() => HomeUseCase(g<HomeRepositories>()));
}

class _$LoggerDi extends LoggerDi {}

class _$DioDi extends DioDi {}
