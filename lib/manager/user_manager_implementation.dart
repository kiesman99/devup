import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

class UserManagerImplementation implements UserManager {
  User _currentUser;

  @override
  bool isLoggedIn;

  @override
  User get currentUser => _currentUser;

  @override
  RxCommand<User, void> createUserByEmailCommand;
  @override
  RxCommand<AuthenticationData, void> logginUserCommand;
  @override
  RxCommand<User, void> updateUserCommand;

  final BehaviorSubject<UserState> _loginStateSubject = BehaviorSubject<UserState>();

  @override
  Observable<UserState> get logInStateChanged => _loginStateSubject;

  UserManagerImplementation() {
    logginUserCommand = RxCommand.createAsyncNoResult(_loginUser);
    createUserByEmailCommand = RxCommand.createAsyncNoResult(_createUserByEmail);
    updateUserCommand = RxCommand.createAsyncNoResult(_updateUser);

    //******************************************************************************
    // Handling login state changes
    //******************************************************************************

    backend<AuthenticationService>();

    // Start listing to changes of the login State
    backend<AuthenticationService>().loginState.asyncMap<UserState>((authResult) async {
      if (authResult != null) {
        // get user from our database
        _currentUser = await backend<DatabaseService>().getUser(authResult.userId);

        if (_currentUser == null) {
          // This means we have a user registered  but no entry in FireStore for it. So we
          // try getting data from auth providers
          var newUser = await backend<AuthenticationService>().getUserDataFromProvider(authResult);

          return UserState(user: newUser, isLoggedIn: true, userDataNotComplete: true);
        } else {
          // sucess
          return UserState(user: _currentUser, isLoggedIn: true);
        }
      }
      return UserState(user: null, isLoggedIn: false);
    }).listen(
      (userState) {
        isLoggedIn = userState.isLoggedIn;
        _loginStateSubject.add(userState);
      },
      onError: (ex) => _loginStateSubject.add(
            UserState(
              isInvalid: true,
              errorMessage: ex.toString(),
            ),
          ),
    );
  }

  ///
  /// Handler for the RxCommands
  ///

  Future<void> _loginUser(AuthenticationData authData) async {
    await backend<AuthenticationService>().loginUser(
      provider: authData.provider,
      email: authData.email,
      password: authData.password,
    );
  }

  Future<void> _createUserByEmail(User user) async {
    var authResult = await backend<AuthenticationService>().createNewUserByEmailPassword(user.email, user.passWord);
    user.id = authResult.userId;
    await _updateUser(user);
  }

  Future _updateUser(User user) async {
    _currentUser = user;
    await backend<DatabaseService>().updateUser(user);
  }
}
