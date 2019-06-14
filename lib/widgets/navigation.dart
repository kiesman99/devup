import 'package:devup/model/user.dart';
import 'package:devup/ui/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final bool hasGoBack;
  final bool hasGoNext;
  final String customNextText;
  final VoidCallback customNextCallback;

  NavigationBar({this.hasGoBack = true, this.hasGoNext = true, this.customNextText, this.customNextCallback});

  NavigationBar.noBackButton() : this(hasGoBack: false);

  NavigationBar.customNextButton(String buttonText, VoidCallback callback)
      : this(
          customNextText: buttonText,
          customNextCallback: callback,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasGoBack)
              MaterialButton(
                color: Colors.blueAccent,
                child: Text("Back"),
                onPressed: () => ProfilePage.of(context).prevPage(),
              ),
            if (customNextCallback == null)
              MaterialButton(
                color: Colors.blueAccent,
                child: Text("Next"),
                onPressed: () => ProfilePage.of(context).nextPage(),
              )
            else
              MaterialButton(
                color: Colors.blueAccent,
                child: Text(customNextText),
                onPressed: customNextCallback,
              )
             
          ],
        ),
      ),
    );
  }
}
