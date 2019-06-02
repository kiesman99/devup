import 'package:flutter/material.dart';

/// Just a simple placeholder
/// SVG PLACEHOLDER
class ColorRect extends StatelessWidget {

  final Color color;
  final double height;
  final double width;
  final double marginTop;
  final double marginBottom;
  final Widget child;

  ColorRect({this.color, this.height, this.width, this.marginTop = 0, this.marginBottom = 0, this.child});

  ColorRect.symmetric({Color color, double size}) : this(color: color, height: size, width: size);

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