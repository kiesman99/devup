import 'package:devup/model/user.dart';

///
/// Interface of an platform agnostic authentication service
///

enum AuthenticationProvider { google, facebook, emailPassword }

enum AuthenticationState {
  success,
  invalidCredentials,
  canceled,
  error,
  notLoggedIn,
}

/// FirebaseAuthResult are emitted on each change of the authentication state of the app
class AuthenticationResult {
  final AuthenticationState state;
  final String errorMessage;
  final String userId;
  final String userPhotoUrl;
  final AuthenticationProvider provider;

  AuthenticationResult(
    this.state, {
    this.userId,
    this.userPhotoUrl,
    this.provider,
    this.errorMessage,
  });
}

/// Used to signal Authentication related errors
class AuthenticationException implements Exception {
  final String message;
  final int code;

  AuthenticationException(this.message, this.code);

  @override
  String toString() => message;
}



abstract class AuthenticationService {
  /// 
  /// Emits FirebaseAuthResults on every change of the authentication state of the App
  Stream<AuthenticationResult> get loginState;

  ///
  /// if a user is logged in this function returns the data that the authentication service provides for this user a
  /// as well as the current AuthenticationState
  Future<AuthenticationResult> checkCurrentUserLogin();

  ///
  /// Initiates the login process. The result is emmited on the [loginState] stream
  /// which mean the user is not yet logged in when this function returns. 
  /// [provider] : which provider should be used ?
  /// [email] / [password] : only needed for AuthenticationProvider.emailPassword
  Future loginUser({
    provider: AuthenticationProvider,
    String email,
    String password,
  });

  Future<AuthenticationResult> createNewUserByEmailPassword(String email, String password);

  Future<bool> sendPasswordResetMessage(String email);

  Future logOut();

  ///
  /// Populates a User object with data from the authentication provider like email, avatar url
  Future<User> getUserDataFromProvider(AuthenticationResult authResult);
}
