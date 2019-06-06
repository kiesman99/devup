import 'package:devup/widgets/avtar_swipe_area.dart';
import 'package:devup/widgets/setup_navigation.dart';
import 'package:flutter/material.dart';

import '../backend.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {
  @override
  Widget build(BuildContext context) {
    var parts = backend<ResourceService>().avatarParts;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.passthrough,
        overflow: Overflow.visible,
        children: <Widget>[
          // Head
          Positioned(
            left: 0,
            right: 0,
            top: 75,
            height: 280,
            child: AvatarSwipeArea(
              parts: parts.heads,
              customColor: Color.fromRGBO(255, 204, 153, 1.0),
            ),
          ),
          //Hair
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 400,
            child: AvatarSwipeArea(
              parts: parts.hairs,
            ),
          ),
          //All others
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Here is something wrong with the Expanded elements. 
                /// actually I don't know hy we need it here at all
                Expanded(
                  child: AvatarSwipeArea(
                    imageHeight: 40,
                    parts: parts.eyes,
                    backgroundColor: Colors.red,
                  ),
                ),
                Expanded(
                  child: AvatarSwipeArea(
                    imageHeight: 60,
                    parts: parts.noses,
                    backgroundColor: Colors.blue,
                  ),
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.mouths,
                  backgroundColor: Colors.green,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.beards,
                  backgroundColor: Colors.yellow,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.bodies,
                  backgroundColor: Colors.purple,
                ),
                Spacer(),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: SetupNavigationBar.noBackButton(
        nextPageCallback: () {},
      ),
    );
  }
}
