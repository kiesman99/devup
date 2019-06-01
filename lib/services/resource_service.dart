import 'package:devup/model/avatar.dart';

class ResourceService
{
    AvatarParts avatarParts = const AvatarParts(
    hairs: {
      'brown': 'brown_hair.svg',
      'black': 'black_hair.svg',
    },
    eyes: {
      'brown': 'brown_eye.svg',
      'black': 'black_blue_eye.svg',
    },
    noses: {
      'nose1': 'nose1.svg',
      'nose2': 'nose2.svg',
    },
    mouths: {
      'mouth1': 'mouth1.svg',
      'mouth2': 'mouth2.svg',
    },
    chins: {
      'chin1': 'chin1.svg',
      'chin2': 'chin2.svg',
    },
    tShirts: {
      'red': 't_shirt_red.svg',
      'blue': 't_shirt_blue.svg',
    },
  );

  List<String> programmingLanguages = const ['Algol', 'Fortran', 'C', 'Dart','Flutter'];

  List<String> languages = const ['English', 'German', 'Dutch', 'Spanish','French'];

  List<String> genders = const ['Male', 'Female', 'Rather not say'];
}