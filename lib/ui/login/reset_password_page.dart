import 'package:devup/backend.dart';
import 'package:devup/widgets/deup_form_field.dart';
import 'package:devup/widgets/dialogs.dart';
import 'package:flutter/material.dart';


class ResetPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordPage();
  }
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  String _emailAdress;
  final GlobalKey<FormState> formKey = GlobalKey(); 


  String _validateEmail(String s) {
    if (s.isEmpty) {
      return "This field is reqired";
    } else if (!s.contains('@') || !s.contains('.')) {
      return "This seems not to be a valid email adress";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: new IntrinsicHeight(
                  child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      DevUpFormField(
                        margin: const EdgeInsets.only(top: 25.0),
                        iconPath: "assets/SVG/icon_male_avatar.svg",
                        hintText: "Email",
                        inputType: TextInputType.emailAddress,
                        onSaved: (s) => _emailAdress = s,
                        validator: (s) => _validateEmail(s),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      resetPasswordButton(),
                      SizedBox(
                        height: 20.0,
                      ),
                      resetPasswordText(),
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                              child: Text(
                                'To Login',
                                style:
                                    TextStyle(color: Theme.of(context).accentColor, fontSize: 16.0),
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            )),
                      ),
                    ],
                  ),
                ),
              ))));
    })));
  }

  Widget resetPasswordButton() {
    return RaisedButton(
      onPressed: () async {
        FormState formState = formKey.currentState;
        if (formState.validate()) {
          formState.save();
          await backend<AuthenticationService>().sendPasswordResetMessage(_emailAdress);
          await showMessageDialog(
              context, 'Reset Email sent!', 'Please check your mailbox and reset your password');
          Navigator.of(context).pop();          
        }
      },
      child: Center(
          child: Text("REQUEST PASSWORD RESET",
              style: const TextStyle(color: Colors.white, fontFamily: 'Roboto-bold'))),
    );
  }

  Widget resetPasswordText() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
        ),
        children: <TextSpan>[
          TextSpan(
              text:
                  'Enter your email address and click on the REQUEST PASSWORD RESET button to retrieve a reset password confirmation message to your email.'),
        ],
      ),
    );
  }
}
