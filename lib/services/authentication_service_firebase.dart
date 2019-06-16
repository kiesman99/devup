/// 
/// Concrete implementation of AuthenticationService based on the Firebase service from google
///
import 'package:devup/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication_service_.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';



class AuthenticationServiceFirebase implements AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  // I haven't set up Facebook login for this App but I leave the code in here for reference
  //  final FacebookLogin _facebookLogin = new FacebookLogin();
  //  FacebookLoginResult _facebookResult;
  FirebaseUser _currentFirebaseUser;
  GoogleSignInAccount _googleUser;
  GoogleSignInAuthentication _googleAuth;

  /// Emits an AuthenticationResult for every FireBaseUser object that is emitted by _auth.onAuthStateChange
  @override
  Stream<AuthenticationResult> get loginState => _auth.onAuthStateChanged.map((firebaseUser) {
        _currentFirebaseUser = firebaseUser;
        return firebaseUser != null
            ? new AuthenticationResult(AuthenticationState.success,
                userId: firebaseUser.uid, userPhotoUrl: firebaseUser.photoUrl, provider: getProvider(firebaseUser))
            : new AuthenticationResult(AuthenticationState.notLoggedIn);
      });

  ///
  /// if a user is logged in this function returns the data that the authentication service provides for this user a
  /// as well as the current AuthenticationState
  @override
  Future<AuthenticationResult> checkCurrentUserLogin() async {
    _currentFirebaseUser = await _auth.currentUser();
    return _currentFirebaseUser != null
        ? new AuthenticationResult(AuthenticationState.success, userId: _currentFirebaseUser.uid)
        : new AuthenticationResult(AuthenticationState.notLoggedIn);
  }

  ///
  /// Initiates the login process. The result is emmited on the [loginState] stream
  /// which mean the user is not yet logged in when this function returns. 
  /// [provider] : which provider should be used ?
  /// [email] / [password] : only needed for AuthenticationProvider.emailPassword
  @override
  Future loginUser({
    provider: AuthenticationProvider,
    String email,
    String password,
  }) async {
    try {
      switch (provider) {
        // case AuthenticationProvider.facebook:
        //   await loginWithFacebook();
        //   break;
        case AuthenticationProvider.google:
          await loginWithGoogle();
          break;
        case AuthenticationProvider.emailPassword:
          await loginWithEmailPassWord(email.trim(), password);
          break;
        default:
          assert(false, "Should never get here");
          return new AuthenticationResult(AuthenticationState.error);
      }
    } on PlatformException catch (ex) {
      throw AuthenticationException(ex.message.toString(), 0);
    }
  }

  Future loginWithGoogle() async {
    _googleUser = await _googleSignIn.signIn();
    if (_googleUser == null) {
      return new AuthenticationResult(AuthenticationState.canceled);
    }
    _googleAuth = await _googleUser.authentication;
    _currentFirebaseUser = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    ));
    print("signed in " + _currentFirebaseUser?.displayName);
  }

  // I haven't set up Facebook login for this App but I leave the code in here for reference
  // Future loginWithFacebook() async {
  //   _facebookResult = await _facebookLogin.logInWithReadPermissions(['email']);

  //   switch (_facebookResult.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       _currentUser = await _auth.signInWithCredential(FacebookAuthProvider.getCredential(accessToken: _facebookResult.accessToken.token));
  //       print("signed in " + _currentUser?.displayName);
  //       break;
  //     case FacebookLoginStatus.cancelledByUser: // do nothing
  //       break;
  //     case FacebookLoginStatus.error:
  //       print(_facebookResult.errorMessage);
  //       throw AuthenticationException(_facebookResult.errorMessage, 0);
  //       break;
  //     default:
  //       assert(false, "Should never get there");
  //       throw AuthenticationException("Unknown FacebookState", 0);
  //     // TODO looging
  //   }
  // }

  /// Logs in with email/password. 
  Future loginWithEmailPassWord(String email, String passWord) async {
    _currentFirebaseUser = await _auth.signInWithEmailAndPassword(email: email, password: passWord);
  }

  @override
  Future logOut() async {
    await _auth.signOut();
    _currentFirebaseUser = null;
  }

  @override
  Future<AuthenticationResult> createNewUserByEmailPassword(String email, String password) async {
    try {
      _currentFirebaseUser = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
      if (_currentFirebaseUser != null) {
        return new AuthenticationResult(AuthenticationState.success, userId: _currentFirebaseUser.uid);
      }
      throw AuthenticationException("Problem creating new User", 0);
    } on PlatformException catch (ex) {
      throw AuthenticationException(ex.message.toString(), 0);
    }
  }

  @override
  Future<bool> sendPasswordResetMessage(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on Object catch (ex) {
      print('Error sending passwort reset message ${ex.toString()}');
      return false;
    }
  }



  /// Extracts the type of Authprovider from the Firebase UserObject
  AuthenticationProvider getProvider(FirebaseUser firebaseUser) {
    assert(firebaseUser != null);
    assert(firebaseUser.providerData.length == 2, "AuthProvider number != 2");

    switch (firebaseUser.providerData[1].providerId) {
      // case "facebook.com":
      //   return AuthenticationProvider.facebook;
      case "google.com":
        return AuthenticationProvider.google;
      case "password":
        return AuthenticationProvider.emailPassword;
      default:
        assert(false, "Unknown provider");
        return null;
    }
  }

  ///
  /// returns a User object that is prepopulated with data that can be accessed from the
  /// Authentication provider
  @override
  Future<User> getUserDataFromProvider(AuthenticationResult authResult) async {
    switch (authResult.provider) {
      case AuthenticationProvider.google:
        return new User(id: authResult.userId, email: _currentFirebaseUser.email);

        break;
      case AuthenticationProvider.facebook:
        //  I haven't set up facebook login, but I leave it here to show you how it would look like
        //
        //   if (_facebookResult == null) return new User(id: authResult.userId);
        //   var accessToken = _facebookResult.accessToken;
        //   var graphResponse = await http.get(
        //       'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,birthday,gender&access_token=${accessToken.token}');
        //   Map<String, dynamic> profile = json.decode(graphResponse.body);

        //   var birthdayAsString = profile['birthday'];
        //   int birthYear;
        //   if (birthdayAsString != null) {
        //     var birthYearAsString = birthdayAsString.substring(birthdayAsString.length - 4);
        //     birthYear = int.parse(birthYearAsString);
        //   }
        //   var genderString = profile['gender'];

        //   Gender gender;
        //   switch (genderString) {
        //     case 'male':
        //       gender = Gender.male;
        //       break;
        //     case 'female':
        //       gender = Gender.female;
        //       break;
        //     default:
        //       gender = Gender.all;
        //   }

        // return new User(
        //     id: authResult.userId,
        //     fullName: profile['name'],
        //     birthYear: birthYear,
        //     email: profile['email'],
        //     photoURL: _currentUser.photoUrl,
        //     gender: gender,
        //     authenticationProvider: "Facebook");

        break;
      case AuthenticationProvider.emailPassword:
        throw Exception('You never should get here');

        break;
    }
    return null;
  }
}
