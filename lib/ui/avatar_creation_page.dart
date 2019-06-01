import 'package:flutter/material.dart';

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
                controller: samplecontroller,
                itemBuilder: (context, index){
                  return _ColorRect.symmetric(
                    color: index % 2 == 0 ? Colors.yellow : Colors.green,
                    size: 50.0,
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
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          return _ColorRect.symmetric(
                            color: index % 2 == 0 ? Colors.pink : Colors.amber,
                            size: 50.0,
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
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          return _ColorRect.symmetric(
                            color: index % 2 == 0 ? Colors.pink : Colors.amber,
                            size: 50.0,
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
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          return _ColorRect.symmetric(
                            color: index % 2 == 0 ? Colors.pink : Colors.amber,
                            size: 50.0,
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
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          return _ColorRect.symmetric(
                            color: index % 2 == 0 ? Colors.pink : Colors.amber,
                            size: 50.0,
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
                        controller: samplecontroller,
                        itemBuilder: (context, index){
                          return _ColorRect.symmetric(
                            color: index % 2 == 0 ? Colors.pink : Colors.amber,
                            size: 50.0,
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
