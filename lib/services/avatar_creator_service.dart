import 'package:devup/model/avatar_part.dart';
import 'package:devup/services/resource_service.dart';
import 'package:flutter/material.dart';

import '../backend.dart';

class AvatarCreatorService {

  Map<String, AvatarPart> bodyMap = {
    "bodies": AvatarPart(
        parts: backend<ResourceService>().avatarParts.bodies,
        resourceDir: "assets/SVG/Body",
        height: 105.0,
        order: 6,
        customColor: Colors.blue
    ),
    "heads": AvatarPart(
        parts: backend<ResourceService>().avatarParts.heads,
        resourceDir: "assets/SVG",
        order: 0,
        customColor: Color.fromRGBO(	255,	204,	153, 1.0)
    ),
    "hairs" : AvatarPart(
        parts: backend<ResourceService>().avatarParts.hairs,
        resourceDir: "assets/SVG/Hair",
        height: 150.0,
        order: 1
    ),
    "eyes" : AvatarPart(
        parts: backend<ResourceService>().avatarParts.eyes,
        resourceDir: "assets/SVG/Eyes",
        height: 40.0,
        order: 2
    ),
    "noses" : AvatarPart(
        parts: backend<ResourceService>().avatarParts.noses,
        resourceDir: "assets/SVG/Nose",
        height: 45.0,
        order: 3
    ),
    "mouths" : AvatarPart(
        parts: backend<ResourceService>().avatarParts.mouths,
        resourceDir: "assets/SVG/Mouth",
        height: 45.0,
        order: 4
    ),
    "beards" : AvatarPart(
        parts: backend<ResourceService>().avatarParts.beards,
        resourceDir: "assets/SVG/Beard",
        height: 55.0,
        order: 5
    )
  };

}