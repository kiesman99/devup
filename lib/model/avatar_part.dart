import 'package:flutter/material.dart';

class AvatarPart {


  /// The actual Controller which
  /// is accessed to move the SVG
  ScrollController actualController;

  /// This is the controller of
  /// the pageView, which actually
  /// lays over the SVG.
  /// This one is used for the GestureInput
  /// and maps it's events to the
  /// [actualController]
  PageController holderController;

  /// The Map that holds the resource names
  Map<String, String> parts;

  /// The root directory in which all resources can be found
  String resourceDir;

  /// the height of the holder PageView
  /// should resemble the space in which
  /// the user can do it's gesture
  double height;

  /// Handles the order in which the holder PageViews
  /// are rendered
  int order;

  /// The Color which will be layed over the SVG
  Color customColor;

  AvatarPart({
    @required this.parts,
    @required this.resourceDir,
    @required this.order,
    this.height = 0.0,
    this.customColor
  }) :
    actualController = new ScrollController(),
    holderController = new PageController() {

    holderController.addListener(() {
      actualController.jumpTo(holderController.offset);
    });

  }
}