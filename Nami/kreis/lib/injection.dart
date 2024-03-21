import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kreis/data/datasources/remote/dio/logging_interceptor.dart';
import 'package:kreis/data/repositories/auth_repository.dart';
import 'package:kreis/presentations/auth/provider/auth_provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => ThemeProvider());
  getIt.registerLazySingleton(() => AuthProvider());
  getIt.registerLazySingleton(() => HomeProvider());
  getIt.registerLazySingleton(() => ItemsProvider());
  getIt.registerLazySingleton(() => ProfileProvider());
  getIt.registerLazySingleton(() => CategoriesProvider());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  ///network
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());

  ///repositories
  getIt.registerLazySingleton(() => AuthRepository());
}
