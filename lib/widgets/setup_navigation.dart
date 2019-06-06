import 'package:flutter/material.dart';

class SetupNavigationBar extends StatelessWidget {

  BuildContext context;
  VoidCallback nextPageCallback;
  bool shouldGoBack;

  SetupNavigationBar({
    @required this.context,
    this.nextPageCallback,
    this.shouldGoBack = true
  });

  SetupNavigationBar.noBackButton({VoidCallback nextPageCallback, BuildContext context})
      : this(nextPageCallback: nextPageCallback, context: context, shouldGoBack: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            if(shouldGoBack)
              FlatButton(
                child: Text("Zurück"),
                onPressed: (){
                  Navigator.of(this.context).pop();
                },
              )
            else
              Container(),

            FlatButton(
              child: Text("Weiter"),
              onPressed: nextPageCallback,
            )
          ],
        ),
      ),
    );
  }
}