import 'dart:async';

import 'package:devup/backend.dart';
import 'package:devup/ui/login/reset_password_page.dart';
import 'package:devup/ui/profile_pages/profile_page.dart';
import 'package:devup/ui/swiping_page.dart';
import 'package:devup/widgets/deup_form_field.dart';
import 'package:devup/widgets/devup_loader.dart';
import 'package:devup/widgets/dialogs.dart';
import 'package:devup/widgets/navigation_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamSubscription loginStateSubscription;
  StreamSubscription errorSubscription;

  String _emailAdress;
  String _passWord;

  final GlobalKey<FormState> formKey = GlobalKey(); 

  @override
  void initState() {
    super.initState();
    loginStateSubscription = backend<UserManager>().logInStateChanged.listen((userState) async {
        DevUpLoader.hide();
      if (userState.isLoggedIn) {
        if (userState.userDataNotComplete) {
          await replacePage(context, SwipingPage());
          await pushPage(
              context,
              ProfilePage(
                user: userState.user,
              ));
        } else {
          print("Before replacing loging page with main page");
          await replacePage(context, SwipingPage());
        }
      }
    });

    errorSubscription = backend<UserManager>().logginUserCommand.thrownExceptions.listen(
      (ex) {
        DevUpLoader.hide();
        showMessageDialog(context, 'Login Problem', ex.toString());
      },
    );
  }

  @override
  void dispose() {
    loginStateSubscription?.cancel();
    errorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: new IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          DevUpFormField(
                            iconPath: "assets/SVG/icon_male_avatar.svg",
                            hintText: "Email",
                            inputType: TextInputType.emailAddress,
                            onSaved: (s) => _emailAdress = s,
                            validator: (s) => _validateEmail(s),
                          ),
                          DevUpFormField(
                            iconPath: "assets/SVG/icon_lock_closed.svg",
                            hintText: "Password",
                            hideText: true,
                            onSaved: (s) => _passWord = s,
                            validator: (s) => s.isEmpty ? "Password cannot be empty" : null,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          signInButton(),
                          SizedBox(
                            height: 10.0,
                          ),
                          orDivider(),
                          SizedBox(
                            height: 10.0,
                          ),
                          googleLoginButton(),
                          Row(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    child: Text(
                                      'SignUp',
                                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                                    ),
                                    onTap: () async => await pushPage(context, ProfilePage()),
                                  )),
                              
                              Expanded(child: SizedBox()),
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                                    ),
                                    onTap: () async => await pushPage(context, ResetPasswordPage()),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _validateEmail(String s) {
    if (s.isEmpty) {
      return "This field is reqired";
    } else if (!s.contains('@') || !s.contains('.')) {
      return "This seems not to be a valid email adress";
    }
    return null;
  }

  RaisedButton signInButton({EdgeInsets margin}) {
    return RaisedButton(
      onPressed: () async {
        FormState formState = formKey.currentState;
        if (formState.validate()) {
          formState.save();
          DevUpLoader.show(context);
          backend<UserManager>().logginUserCommand(new AuthenticationData(
            provider: AuthenticationProvider.emailPassword,
            email: _emailAdress,
            password: _passWord,
          ));
        } else {
          await showMessageDialog(
              context, "Dear user", "Some data you entered is invalid. Please correct and try again.");
        }
      },
      child: Center(child: Text("SIGN IN", style: const TextStyle(color: Colors.white, fontFamily: 'Roboto-bold'))),
    );
  }

  Widget orDivider({EdgeInsets margin = EdgeInsets.zero}) {
    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Color(0xffCCCCCC),
            width: 75.0,
            height: 1.0,
            margin: const EdgeInsets.only(right: 17.0),
          ),
          Text("OR", style: const TextStyle(color: const Color(0xff999999))),
          Container(color: Color(0xffCCCCCC), width: 75.0, height: 1.0, margin: const EdgeInsets.only(left: 17.0)),
        ],
      ),
    );
  }

  
  RaisedButton googleLoginButton({EdgeInsets margin}) {
    return RaisedButton(
      color: Color.fromARGB(255, 230, 230, 230),
      onPressed: () {
        DevUpLoader.show(context);
        backend<UserManager>().logginUserCommand(
          new AuthenticationData(provider: AuthenticationProvider.google),
        );
      },
      child: Center(
        child: Row(mainAxisSize: MainAxisSize.min,
          children: [
          Container(width: 40.0, height: 40.0, child: SvgPicture.asset("assets/SVG/google_logo.svg")),
          SizedBox(width: 16,),
          Text(
            "Login with Google",
            style: const TextStyle(color: const Color(0xff526270)),
          ),
        ]),
      ),
    );
  }
}
