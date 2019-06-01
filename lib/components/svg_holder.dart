import 'package:flutter/material.dart';

class SVGHolder extends StatelessWidget {

  final Widget child;

  final double marginTop;
  final double marginBottom;

  SVGHolder({this.marginTop = 0, this.marginBottom = 0, this.child});

  SVGHolder.symmetrical({double margin}) : this(marginTop: margin, marginBottom: margin);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom
      ),
      child: child,
    );
  }
}