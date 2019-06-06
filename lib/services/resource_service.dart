import 'package:devup/model/avatar_parts.dart';


class ResourceService {
   AvatarParts avatarParts = const AvatarParts(hairs: {
    'Hair1': 'assets/SVG/Hair/Hair1.svg',
    'Hair2': 'assets/SVG/Hair/Hair2.svg',
    'Hair3': 'assets/SVG/Hair/Hair3.svg',
    'Hair4': 'assets/SVG/Hair/Hair4.svg',
    'Hair5': 'assets/SVG/Hair/Hair5.svg',
  }, eyes: {
    'Eyes1': 'assets/SVG/Eyes/Eyes1.svg',
    'Eyes2': 'assets/SVG/Eyes/Eyes2.svg',
    'Eyes3': 'assets/SVG/Eyes/Eyes3.svg',
    'Eyes4': 'assets/SVG/Eyes/Eyes4.svg',
    'Eyes5': 'assets/SVG/Eyes/Eyes5.svg',
    'Eyes6': 'assets/SVG/Eyes/Eyes6.svg',
    'Eyes7': 'assets/SVG/Eyes/Eyes7.svg',
    'Eyes8': 'assets/SVG/Eyes/Eyes8.svg',
    'Eyes9': 'assets/SVG/Eyes/Eyes9.svg',
  }, noses: {
    'Nose1': 'assets/SVG/Nose/Nose1.svg',
    'Nose2': 'assets/SVG/Nose/Nose2.svg',
    'Nose3': 'assets/SVG/Nose/Nose3.svg',
    'Nose4': 'assets/SVG/Nose/Nose4.svg',
  }, mouths: {
    'Mouth1': 'assets/SVG/Mouth/Mouth1.svg',
    'Mouth2': 'assets/SVG/Mouth/Mouth2.svg',
    'Mouth3': 'assets/SVG/Mouth/Mouth3.svg',
    'Mouth4': 'assets/SVG/Mouth/Mouth4.svg',
    'Mouth5': 'assets/SVG/Mouth/Mouth5.svg',
    'Mouth6': 'assets/SVG/Mouth/Mouth6.svg',
  }, beards: {
    'Beard1': 'assets/SVG/Beard/Beard1.svg',
    'Beard2': 'assets/SVG/Beard/Beard2.svg',
    'Beard3': 'assets/SVG/Beard/Beard3.svg',
    'Beard4': 'assets/SVG/Beard/Beard4.svg',
    'Beard5': 'assets/SVG/Beard/Beard5.svg'
  }, bodies: {
    'Body1': 'assets/SVG/Body/Body1.svg',
    'Body2': 'assets/SVG/Body/Body2.svg',
    'Body3': 'assets/SVG/Body/Body3.svg',
    'Body4': 'assets/SVG/Body/Body4.svg',
    'Body5': 'assets/SVG/Body/Body5.svg',
  }, heads: {
    'Head1': "assets/SVG/Head.svg"
  });


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
