import 'package:devup/model/user.dart';
import 'package:flutter/material.dart';

class SwipingCard extends StatelessWidget {

  final User user;
  final Size screenSize;
  final Function swipeLeft, swipeRight;
  final DecorationImage image;

  SwipingCard({this.user, this.screenSize, this.image, this.swipeLeft, this.swipeRight});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: Container(                      
        width: screenSize.width / 1.2,
        height: screenSize.height / 1.6,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: screenSize.width / 1.2 ,
              height: screenSize.height / 2.2,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(8.0),
                    topRight: new Radius.circular(8.0)),
                image: image,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Programming Languages",
                  ),
                  Row(
                    children: List.generate(user.programmingLanguages.length, (index) {
                      final String programmingLanguage = user.programmingLanguages[index];

                      return Chip(
                        label: Text(programmingLanguage),
                      );
                    }),
                  ),
                  Text(
                    "Languages"
                  ),
                  Text(
                    "Personal Info"
                  ),
                  
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text("NOPE"),
                    onPressed: swipeLeft,
                  ),
                  FlatButton(
                    child: Text("LIKE"),
                    onPressed: swipeRight,
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}