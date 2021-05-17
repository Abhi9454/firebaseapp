import 'package:firebaseapp/services/authentication_service.dart';
import 'package:firebaseapp/services/dialog_service.dart';
import 'package:firebaseapp/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}