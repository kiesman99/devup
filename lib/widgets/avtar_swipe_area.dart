import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarSwipeArea extends StatelessWidget {
  final String resourceDir;
  final double imageHeight;
  final double swipeAeraHeight;
  final Alignment imageAlign;
  final PageController controller;
  final Map<String, String> parts;
  final Color customColor;
  final Color backgroundColor;

  AvatarSwipeArea({
    this.resourceDir,
    this.imageHeight,
    @required this.swipeAeraHeight,
    this.imageAlign,
    this.controller,
    this.parts,
    this.customColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: swipeAeraHeight,
      color: backgroundColor,
      child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: parts.entries
              .map<Widget>(
                (part) => Container(
                      height: imageHeight,
                      alignment:imageAlign,
                      child: SvgPicture.asset(
                        part.value,
                        color: customColor,
                        fit: BoxFit.fitWidth, // will change to fitHeight as soon as the SVGs are resized
                      ),
                    ),
              )
              .toList()),
    );
  }
}
