import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:rxdart/rxdart.dart';


class AuthenticationData {
  AuthenticationData({this.provider, this.email, this.password});

  final AuthenticationProvider provider;
  final String email;
  final String password;
}

class UserManager {


  // Here we add authentication

}
