import 'package:blog/repositories/blog_repository.dart';
import 'package:blog/repositories/repos.dart';
import 'package:blog/utils/utils.dart';
import 'package:dio/dio.dart';

import '../services/services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() =>
      DioHttpClientService(baseUrl, Dio(), interceptors: [AuthInterceptor()]));
  locator.registerLazySingleton(() => SharedPreferenceService());
  locator.registerLazySingleton(
      () => AuthRepo(locator.get<DioHttpClientService>()));

  locator.registerLazySingleton(
      () => BlogRepo(locator.get<DioHttpClientService>()));
}
