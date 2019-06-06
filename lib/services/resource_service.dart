import 'package:devup/model/avatar_part.dart';
import 'package:devup/model/avatar_parts.dart';
import 'package:flutter/material.dart';

import '../backend.dart';

class ResourceService {
  static AvatarParts avatarParts = const AvatarParts(hairs: {
    'Hair1': 'Hair1.svg',
    'Hair2': 'Hair2.svg',
    'Hair3': 'Hair3.svg',
    'Hair4': 'Hair4.svg',
    'Hair5': 'Hair5.svg',
  }, eyes: {
    'Eyes1': 'Eyes1.svg',
    'Eyes2': 'Eyes2.svg',
    'Eyes3': 'Eyes3.svg',
    'Eyes4': 'Eyes4.svg',
    'Eyes5': 'Eyes5.svg',
    'Eyes6': 'Eyes6.svg',
    'Eyes7': 'Eyes7.svg',
    'Eyes8': 'Eyes8.svg',
    'Eyes9': 'Eyes9.svg',
  }, noses: {
    'Nose1': 'Nose1.svg',
    'Nose2': 'Nose2.svg',
    'Nose3': 'Nose3.svg',
    'Nose4': 'Nose4.svg',
  }, mouths: {
    'Mouth1': 'Mouth1.svg',
    'Mouth2': 'Mouth2.svg',
    'Mouth3': 'Mouth3.svg',
    'Mouth4': 'Mouth4.svg',
    'Mouth5': 'Mouth5.svg',
    'Mouth6': 'Mouth6.svg',
  }, beards: {
    'Beard1': 'Beard1.svg',
    'Beard2': 'Beard2.svg',
    'Beard3': 'Beard3.svg',
    'Beard4': 'Beard4.svg',
    'Beard5': 'Beard5.svg'
  }, bodies: {
    'Body1': 'Body1.svg',
    'Body2': 'Body2.svg',
    'Body3': 'Body3.svg',
    'Body4': 'Body4.svg',
    'Body5': 'Body5.svg',
  }, heads: {
    'Head1': "Head.svg"
  });

  Map<String, AvatarPart> avatarBody = {
    "bodies": AvatarPart(
        parts: avatarParts.bodies,
        resourceDir: "assets/SVG/Body",
        height: 105.0,
        order: 6,
        customColor: Colors.blue),
    "heads": AvatarPart(
        parts: avatarParts.heads,
        resourceDir: "assets/SVG",
        order: 0,
        customColor: Color.fromRGBO(255, 204, 153, 1.0)),
    "hairs": AvatarPart(
        parts: avatarParts.hairs,
        resourceDir: "assets/SVG/Hair",
        height: 150.0,
        order: 1),
    "eyes": AvatarPart(
        parts: avatarParts.eyes,
        resourceDir: "assets/SVG/Eyes",
        height: 40.0,
        order: 2),
    "noses": AvatarPart(
        parts: avatarParts.noses,
        resourceDir: "assets/SVG/Nose",
        height: 45.0,
        order: 3),
    "mouths": AvatarPart(
        parts: avatarParts.mouths,
        resourceDir: "assets/SVG/Mouth",
        height: 45.0,
        order: 4),
    "beards": AvatarPart(
        parts: avatarParts.beards,
        resourceDir: "assets/SVG/Beard",
        height: 55.0,
        order: 5)
  };

  List<String> programmingLanguages = const [
    'Algol',
    'Fortran',
    'C',
    'Dart',
    'Flutter'
  ];

  List<String> languages = const [
    'English',
    'German',
    'Dutch',
    'Spanish',
    'French'
  ];

  List<String> genders = const ['Male', 'Female', 'Rather not say'];

  List<String> experience = const ["Beginner", "Intermediate", "Advanced"];
}
