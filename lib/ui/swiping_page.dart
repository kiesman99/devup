import 'package:devup/backend.dart';
import 'package:devup/components/swipe_card.dart';
import 'package:devup/model/user.dart';
import 'package:flutter/material.dart';

class SwipingPage extends StatefulWidget {
  @override
  _SwipingPageState createState() => _SwipingPageState();
}

class _SwipingPageState extends State<SwipingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: SwipingCard(
                  user: User(),
                  screenSize: MediaQuery.of(context).size,
                  image: DecorationImage(
                    image: new ExactAssetImage('assets/300.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}