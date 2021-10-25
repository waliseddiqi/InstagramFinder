

import 'package:get_it/get_it.dart';
import 'package:instagramfinder/Services/local_storage_services.dart';
import 'package:instagramfinder/Services/requests.dart';

final locator = GetIt.instance;

Future setUpLocator() async {
  locator.registerLazySingleton<NonCachableRequest>(() => NonCachableRequest());
  
  locator.registerLazySingleton<GetRequest>(() => GetRequest());

  var instance = await LocalStorageService.getInstance();

  locator.registerSingleton<LocalStorageService>(instance);

}
