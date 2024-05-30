import 'package:get_it/get_it.dart';
import 'package:our_groceries/src/services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => NavigationService());
  // Register models
  // Register viewmodels
}
