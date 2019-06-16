import 'package:devup/manager/user_manager.dart';
import 'package:devup/services/database_service.dart';
import 'package:devup/services/resource_service.dart';
import 'package:get_it/get_it.dart';
import 'package:devup/services/authentication_service_firebase.dart';
import 'package:devup/services/authentication_service_.dart';

import 'manager/matching_manager.dart';

export 'package:devup/manager/user_manager.dart';
export 'package:devup/services/resource_service.dart';
export 'package:devup/services/database_service.dart';
export 'manager/matching_manager.dart';
export 'package:devup/services/authentication_service_.dart';


GetIt backend = GetIt();


void initBackend() {
    /// Be sure to add then in then sequence they have to be initialized
    backend.registerSingleton<ResourceService>(ResourceService());
    backend.registerSingleton<DatabaseService>(DatabaseServiceFireStore());
    backend.registerSingleton<AuthenticationService>(AuthenticationServiceFirebase());
    backend.registerSingleton<UserManager>(UserManager());
    backend.registerLazySingleton<MatchingManager>(() => MatchingManager());

}