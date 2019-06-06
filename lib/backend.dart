import 'package:devup/manager/user_manager.dart';
import 'package:devup/services/database_service.dart';
import 'package:devup/services/resource_service.dart';
import 'package:devup/services/avatar_creator_service.dart';
import 'package:get_it/get_it.dart';

export 'package:devup/manager/user_manager.dart';
export 'package:devup/services/resource_service.dart';
export 'package:devup/services/database_service.dart';
export 'package:devup/services/avatar_creator_service.dart';

GetIt backend = GetIt();


void initBackend() {
    backend.registerSingleton<UserManager>(UserManager());
    backend.registerSingleton<ResourceService>(ResourceService());
    backend.registerSingleton<DatabaseService>(DatabaseServiceFireStore());
}