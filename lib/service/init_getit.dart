import 'package:get_it/get_it.dart';
import 'package:mvvm_statemanagements_project/repository/movies_repo.dart';
import 'package:mvvm_statemanagements_project/service/api_service.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepository(getIt<ApiService>()));
}