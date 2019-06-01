import 'package:devup/components/swipe_card.dart';
import 'package:devup/model/user.dart';
import 'package:flutter/material.dart';

class SwipingPage extends StatefulWidget {
  @override
  _SwipingPageState createState() => _SwipingPageState();
}

class _SwipingPageState extends State<SwipingPage> {
  int currentIndex = 0;

  final List<User> users = [
    User.fromJson({'programmingLanguages': ['JSON'], 'spokenLanguages': ['English'], 'experience': 0}),
    User.fromJson({'programmingLanguages': ['JSON'], 'spokenLanguages': ['English'], 'experience': 1}),
    User.fromJson({'programmingLanguages': ['JS', 'HTML'], 'spokenLanguages': ['English'], 'experience': 2}),
    User.fromJson({'programmingLanguages': ['JSON'], 'spokenLanguages': ['English'], 'experience': 0}),
    User.fromJson({'programmingLanguages': ['JSON'], 'spokenLanguages': ['English'], 'experience': 0}),
    User.fromJson({'programmingLanguages': ['JSON'], 'spokenLanguages': ['English'], 'experience': 0}),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: SwipingCard(
            user: users[currentIndex],
            screenSize: MediaQuery.of(context).size,
            image: DecorationImage(
              image: ExactAssetImage('assets/300.png'),
              fit: BoxFit.cover,
            ),
            swipeLeft: () {
              setState(() {
                currentIndex++;
              });
            },
            swipeRight: () {
              setState(() {
                currentIndex++;
              });
            },
          ),
        ),
      )
    );
  }
}