import 'package:devup/components/setup_navigation.dart';
import 'package:devup/components/svg_holder.dart';
import 'package:devup/services/resource_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../backend.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {

  PageController samplecontroller;

  static List<String> _stackElements = [
    "SKIN",
    "HAIR",
    "EYES",
    "NOSE",
    "MOUTH",
    "BEARD",
    "CLOTHES"
  ];

  @override
  void initState() {



    super.initState();
    samplecontroller = new PageController();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keep space for system used space
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              // skin
              _ColorRect.symmetric(
                color: Colors.red,
                size: 500.0,
              ),
              //hair
              PageView.builder(
                itemCount: backend<ResourceService>().avatarParts.hairs.length,
                controller: samplecontroller,
                itemBuilder: (context, index){
                  String assetName = backend<ResourceService>().avatarParts.hairs["Hair" + (index + 1).toString()];
                  return SVGHolder(
                      child: SvgPicture.asset(
                        "assets/SVG/Hair/" + assetName,
                      )
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SVGHolder(
                    marginTop: 50.0,
                    child: SizedBox(
                      height: 100.0,
                      child: PageView.builder(
                        itemCount: backend<ResourceService>().avatarParts.eyes.length,
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          String assetName = backend<ResourceService>().avatarParts.eyes["Eyes" + (index + 1).toString()];
                          return SVGHolder(
                          child: SvgPicture.asset(
                            "assets/SVG/Eyes/" + assetName,
                            )
                          );
                        },
                      ),
                    ),
                  ),
                  SVGHolder(
                    marginTop: 50.0,
                    child: SizedBox(
                      height: 100.0,
                      child: PageView.builder(
                        itemCount: backend<ResourceService>().avatarParts.noses.length,
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          String assetName = backend<ResourceService>().avatarParts.noses["Nose" + (index + 1).toString()];
                          return SVGHolder(
                              child: SvgPicture.asset(
                                "assets/SVG/Nose/" + assetName,
                              )
                          );
                        },
                      ),
                    ),
                  ),
                  SVGHolder(
                    marginTop: 50.0,
                    child: SizedBox(
                      height: 100.0,
                      child: PageView.builder(
                        itemCount: backend<ResourceService>().avatarParts.beards.length,
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          String assetName = backend<ResourceService>().avatarParts.beards["Beard" + (index + 1).toString()];
                          return SVGHolder(
                              child: SvgPicture.asset(
                                "assets/SVG/Beard/" + assetName,
                              )
                          );
                        },
                      ),
                    ),
                  ),
                  SVGHolder(
                    marginTop: 50.0,
                    child: SizedBox(
                      height: 100.0,
                      child: PageView.builder(
                        itemCount: backend<ResourceService>().avatarParts.mouths.length,
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          String assetName = backend<ResourceService>().avatarParts.mouths["Mouth" + (index + 1).toString()];
                          return SVGHolder(
                              child: SvgPicture.asset(
                                "assets/SVG/Mouth/" + assetName,
                              )
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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

  _ColorRect({this.color, this.height, this.width});

  _ColorRect.symmetric({Color color, double size}) : this(color: color, height: size, width: size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }
}
