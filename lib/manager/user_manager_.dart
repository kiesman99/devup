import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rx_command/rx_command.dart';

class AuthenticationData {
  AuthenticationData({this.provider, this.email, this.password});

  final AuthenticationProvider provider;
  final String email;
  final String password;
}

class UserState {
  final bool isLoggedIn;
  /// If the user is logged in but has no record in our Database yet
  /// [userDataNotComplete] is set to true.
  final bool userDataNotComplete;
  final User user;
  final bool isInvalid;
  final String errorMessage;

  UserState({
    this.isLoggedIn,
    this.user,
    this.userDataNotComplete = false,
    this.isInvalid = false,
    this.errorMessage,
  });
}

abstract class UserManager {
  bool isLoggedIn;

  User get currentUser;

  // Emits a UserState object on every change of the login state of the App
  Observable<UserState> get logInStateChanged;

  // User Commands
  RxCommand<AuthenticationData, void> logginUserCommand;
  RxCommand<User, void> updateUserCommand;
  RxCommand<User, void> createUserByEmailCommand;
}
