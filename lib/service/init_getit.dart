import 'package:get_it/get_it.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}