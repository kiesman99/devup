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
  Map<String, PageController> actualControllers = {
    "bodies" : new PageController(),
    "heads" : new PageController(),
    "hairs" : new PageController(),
    "eyes" : new PageController(),
    "noses" : new PageController(),
    "mouths" : new PageController(),
    "beards" : new PageController(),
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
              child: PageView.builder(
                controller: actualControllers["bodies"],
                itemCount: bodyParts["bodies"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                    "assets/SVG/Body/" + bodyParts["bodies"].values.elementAt(index),
                  );
                },
              ),
            ),
            // Head
            Container(
              child: SvgPicture.asset(
                "assets/SVG/Head.svg",
                color: Color.fromRGBO( 255, 205, 148, 1),
              ),
            ),
            // HAIR
            Container(
              child: PageView.builder(
                controller: actualControllers["hairs"],
                itemCount: bodyParts["hairs"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                      "assets/SVG/Hair/" + bodyParts["hairs"].values.elementAt(index)
                  );
                },
              ),
            ),
            // EYES
            Container(
              child: PageView.builder(
                controller: actualControllers["eyes"],
                itemCount: bodyParts["eyes"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                      "assets/SVG/Eyes/" + bodyParts["eyes"].values.elementAt(index)
                  );
                },
              ),
            ),
            // NOSE
            Container(
              child: PageView.builder(
                controller: actualControllers["noses"],
                itemCount: bodyParts["noses"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                    "assets/SVG/Nose/" + bodyParts["noses"].values.elementAt(index),
                  );
                },
              ),
            ),
            // MOUTH
            Container(
              child: PageView.builder(
                controller: actualControllers["mouths"],
                itemCount: bodyParts["mouths"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                      "assets/SVG/Mouth/" + bodyParts["mouths"].values.elementAt(index)
                  );
                },
              ),
            ),
            // BEARD
            Container(
              child: PageView.builder(
                controller: actualControllers["beards"],
                itemCount: bodyParts["beards"].length,
                itemBuilder: (context, index){
                  return SvgPicture.asset(
                    "assets/SVG/Beard/" + bodyParts["beards"].values.elementAt(index),
                  );
                },
              ),
            ),
            _ColorRect(
              color: Colors.transparent,
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
            _ColorRect(
              color: Colors.transparent,
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
            _ColorRect(
              color: Colors.transparent,
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
            _ColorRect(
              color: Colors.transparent,
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
            _ColorRect(
              color: Colors.transparent,
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
            _ColorRect(
              color: Colors.transparent,
              height: 110.0,
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


/// Just a simple placeholder
/// SVG PLACEHOLDER
class _ColorRect extends StatelessWidget {

  final Color color;
  final double height;
  final double width;
  final double marginTop;
  final double marginBottom;
  final Widget child;

  _ColorRect({this.color, this.height, this.width, this.marginTop = 0, this.marginBottom = 0, this.child});

  _ColorRect.symmetric({Color color, double size}) : this(color: color, height: size, width: size);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color
      ),
      child: child ?? Container(),
    );
  }
}
