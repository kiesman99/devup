import 'package:devup/manager/user_manager.dart';
import 'package:get_it/get_it.dart';

GetIt backend = GetIt();


void initBackend()
{
    backend.registerSingleton<UserManager>(UserManager());
}