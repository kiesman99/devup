import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.jser.dart';

class User {
  String id;
  String userName;
  @ignore // We don't store the password in the database but makes it a bit more comfortable when creating the user
  String passWord;
  String hair;
  String eyes;
  String nose;
  String mouth;
  String chin;
  String body;
  int skinColor;
  int bodyColor;
  List<String> spokenLanguages;
  @pass
  GeoPoint location;
  int age;
  List<String> programmingLanguages;
  String email;
  String phone;
  String github;
  String occupation;
  String gender;
  String personalInfo;
  int experience;

  User(
      {this.userName,
      this.hair,
      this.eyes,
      this.mouth,
      this.chin,
      this.nose,
      this.body,
      this.skinColor,
      this.bodyColor,
      this.programmingLanguages,
      this.age,
      this.gender,
      this.occupation,
      this.experience,
      this.location,
      this.personalInfo,
      this.spokenLanguages,
      this.email,
      this.github,
      this.phone,
      this.id});

  User copyWith({
    String id,
    String userName,
    String hair,
    String eyes,
    String nose,
    String mouth,
    String chin,
    String body,
    int skinColor,
    int bodyColor,
    List<String> spokenLanguages,
    GeoPoint location,
    int age,
    List<String> programmingLanguages,
    String email,
    String phone,
    String github,
    String occupation,
    String gender,
    String personalInfo,
    int experience,
  }) {
    return User(
      userName: userName ?? this.userName,
      hair: hair ?? this.hair,
      eyes: eyes ?? this.eyes,
      mouth: mouth ?? this.mouth,
      chin: chin ?? this.chin,
      nose: nose ?? this.nose,
      body: body ?? this.body,
      skinColor: skinColor ?? this.skinColor,
      bodyColor: bodyColor ?? this.bodyColor,
      programmingLanguages: programmingLanguages ?? this.programmingLanguages,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      occupation: occupation ?? this.occupation,
      experience: experience ?? this.experience,
      location: location ?? this.location,
      personalInfo: personalInfo ?? this.personalInfo,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      email: email ?? this.email,
      github: github ?? this.github,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }
}

@GenSerializer()
class UserJsonSerializer extends Serializer<User> with _$UserJsonSerializer {
}
