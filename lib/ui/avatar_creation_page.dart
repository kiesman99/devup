import 'package:flutter/material.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {

  PageController samplecontroller;

  @override
  void initState() {

    samplecontroller = new PageController(viewportFraction: 0.8);

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      // keep space for system used space
      child: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              _ColorRect.symmetric(
                color: Colors.red,
                size: 500.0,
              ),
              SizedBox(
                height: 50.0,
                child: PageView.builder(
                  controller: samplecontroller,
                  itemBuilder: (context, index){
                    return _ColorRect.symmetric(
                      color: index % 2 == 0 ? Colors.yellow : Colors.green,
                      size: 50.0,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SVGHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


/// Just a simple placeholder
class _ColorRect extends StatelessWidget {

  Color color;
  double height;
  double width;

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
