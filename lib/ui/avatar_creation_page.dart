import 'package:devup/components/color_rect.dart';
import 'package:devup/components/setup_navigation.dart';
import 'package:devup/services/resource_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../backend.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {


  /// create the actual controller which
  /// determine the position of the
  /// actual bodyPart
  Map<String, ScrollController> actualControllers = {
    "bodies" : new ScrollController(),
    "heads" : new ScrollController(),
    "hairs" : new ScrollController(),
    "eyes" : new ScrollController(),
    "noses" : new ScrollController(),
    "mouths" : new ScrollController(),
    "beards" : new ScrollController(),
  };

  /// create the pageController holder
  /// which will fake input and
  /// redirect it to the underlaying
  /// pagecontroller
  Map<String, PageController> holderControllers = {
    "bodies" : new PageController(),
    "heads" : new PageController(),
    "hairs" : new PageController(),
    "eyes" : new PageController(),
    "noses" : new PageController(),
    "mouths" : new PageController(),
    "beards" : new PageController(),
  };

  Map<String, dynamic> bodyParts = {
    "bodies" : backend<ResourceService>().avatarParts.bodies,
    "heads" : backend<ResourceService>().avatarParts.heads,
    "hairs" : backend<ResourceService>().avatarParts.hairs,
    "eyes" : backend<ResourceService>().avatarParts.eyes,
    "noses" : backend<ResourceService>().avatarParts.noses,
    "mouths" : backend<ResourceService>().avatarParts.mouths,
    "beards" : backend<ResourceService>().avatarParts.beards,
  };

  double get _screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    // TODO: implement initState


    // bind holder to actual controller
    for(int i = 0; i < holderControllers.values.length; i++){
      PageController holderController = holderControllers.values.elementAt(i);
      holderController.addListener((){
        actualControllers.values.elementAt(i).jumpTo(holderController.offset);
      });
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            //Body
            Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["bodies"],
                itemCount: bodyParts["bodies"].length,
                itemBuilder: (_, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                      "assets/SVG/Body/" + bodyParts["bodies"].values.elementAt(index),
                    ),
                  );
                },
              ),
            ),
            // Head
            Container(
              width: _screenWidth,
              child: SvgPicture.asset(
                "assets/SVG/Head.svg",
                color: Color.fromRGBO( 255, 205, 148, 1),
              ),
            ),
            // HAIR
            Container(
              width: _screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["hairs"],
                itemCount: bodyParts["hairs"].length,
                itemBuilder: (context, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                        "assets/SVG/Hair/" + bodyParts["hairs"].values.elementAt(index)
                    ),
                  );
                },
              ),
            ),
            // EYES
            Container(
              width: _screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["eyes"],
                itemCount: bodyParts["eyes"].length,
                itemBuilder: (context, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                        "assets/SVG/Eyes/" + bodyParts["eyes"].values.elementAt(index)
                    ),
                  );
                },
              ),
            ),
            // NOSE
            Container(
              width: _screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["noses"],
                itemCount: bodyParts["noses"].length,
                itemBuilder: (context, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                      "assets/SVG/Nose/" + bodyParts["noses"].values.elementAt(index),
                    ),
                  );
                },
              ),
            ),
            // MOUTH
            Container(
              width: _screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["mouths"],
                itemCount: bodyParts["mouths"].length,
                itemBuilder: (context, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                        "assets/SVG/Mouth/" + bodyParts["mouths"].values.elementAt(index)
                    ),
                  );
                },
              ),
            ),
            // BEARD
            Container(
              width: _screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: actualControllers["beards"],
                itemCount: bodyParts["beards"].length,
                itemBuilder: (context, index){
                  return Container(
                    width: _screenWidth,
                    child: SvgPicture.asset(
                      "assets/SVG/Beard/" + bodyParts["beards"].values.elementAt(index),
                    ),
                  );
                },
              ),
            ),
            ColorRect(
              color: Colors.green.withOpacity(0.3),
              height: 50.0,
              marginTop: 160.0,
              child: PageView.builder(
                controller: holderControllers["hairs"],
                itemCount: bodyParts["hairs"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
            ColorRect(
              color: Colors.blue.withOpacity(0.3),
              height: 40.0,
              marginTop: 210.0,
              child: PageView.builder(
                controller: holderControllers["eyes"],
                itemCount: bodyParts["eyes"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
            ColorRect(
              color: Colors.red.withOpacity(0.3),
              height: 45.0,
              marginTop: 250.0,
              child: PageView.builder(
                controller: holderControllers["noses"],
                itemCount: bodyParts["noses"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
            ColorRect(
              color: Colors.yellow.withOpacity(0.3),
              height: 45.0,
              marginTop: 295.0,
              child: PageView.builder(
                controller: holderControllers["mouths"],
                itemCount: bodyParts["mouths"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
            ColorRect(
              color: Colors.pink.withOpacity(0.3),
              height: 55.0,
              marginTop: 340.0,
              child: PageView.builder(
                controller: holderControllers["beards"],
                itemCount: bodyParts["beards"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
            ColorRect(
              color: Colors.purple.withOpacity(0.3),
              height: 105.0,
              marginTop: 395.0,
              child: PageView.builder(
                controller: holderControllers["bodies"],
                itemCount: bodyParts["bodies"].length,
                itemBuilder: (_, __){
                  return Container();
                },
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: SetupNavigationBar.noBackButton(
        nextPageCallback: () {

        },
      ),
    );
  }
}



