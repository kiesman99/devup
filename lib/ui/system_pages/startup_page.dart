import 'dart:async';

import 'package:devup/backend.dart';
import 'package:devup/ui/login/login_page.dart';
import 'package:devup/ui/swiping_page.dart';
import 'package:devup/widgets/devup_loader.dart';
import 'package:devup/widgets/navigation_functions.dart';
import 'package:flutter/material.dart';

//*********************************************************
/// <summary>
/// This widget is the root of your application.
/// </summary>
//*********************************************************
class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  StreamSubscription loginStateChangedSubscription;

  @override
  void initState() {
    super.initState();

    startListeningForLoginState();
  }

  void startListeningForLoginState() {
    loginStateChangedSubscription = backend.get<UserManager>().logInStateChanged.listen(
      (userState) async {
        if (userState.isLoggedIn) {
          await replacePage(context, SwipingPage());
        } else {
          await replacePage(context, LoginPage());
        }
      },
    );
  }

  //*********************************************************
  /// <summary>
  /// dispose
  /// </summary>
  //*********************************************************
  @override
  dispose() {
    loginStateChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator(),),
      );

  }
}
