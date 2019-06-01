import 'package:devup/model/avatar.dart';

class ResourceService
{
    AvatarParts avatarParts = const AvatarParts(
    hairs: {
      'Hair1': 'Hair1.svg',
      'Hair2': 'Hair2.svg',
      'Hair3': 'Hair3.svg',
      'Hair4': 'Hair4.svg',
    },
    eyes: {
      'Eyes1': 'Eyes1.svg',
      'Eyes2': 'Eyes2.svg',
      'Eyes3': 'Eyes3.svg',
      'Eyes4': 'Eyes4.svg',
      'Eyes5': 'Eyes5.svg',
      'Eyes6': 'Eyes6.svg',
      'Eyes7': 'Eyes7.svg',
      'Eyes8': 'Eyes8.svg',
      'Eyes9': 'Eyes9.svg',
      'Eyes10': 'Eyes10.svg',
    },
    noses: {
      'Nose1': 'Nose1.svg',
      'Nose2': 'Nose2.svg',
      'Nose3': 'Nose3.svg',
      'Nose4': 'Nose4.svg',
    },
    mouths: {
      'Mouth1': 'Mouth1.svg',
      'Mouth2': 'Mouth2.svg',
      'Mouth3': 'Mouth3.svg',
      'Mouth4': 'Mouth4.svg',
      'Mouth5': 'Mouth5.svg',
    },
    beards: {
      'Beard1': 'Beard1.svg',
      'Beard2': 'Beard2.svg',
      'Beard3': 'Beard3.svg',
      'Beard4': 'Beard4.svg',
    }
  );

  List<String> programmingLanguages = const ['Algol', 'Fortran', 'C', 'Dart','Flutter'];

  List<String> languages = const ['English', 'German', 'Dutch', 'Spanish','French'];

  List<String> genders = const ['Male', 'Female', 'Rather not say'];

  List<String> experience = const ["Beginner", "Intermediate", "Advanced"];
}