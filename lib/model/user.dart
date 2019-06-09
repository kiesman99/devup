import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  String id;
  String userName;
  String hair;
  String eyes;
  String nose;
  String mouth;
  String chin;
  String body;
  int skinColor;

  List<String> spokenLanguages;

  GeoPoint location;
  int age;

  List<String> programmingLanguages;
  String emailOrPhone;

  String occupation;

  String gender;

  String personalInfo;

  int experience;

  User({
    this.userName,
    this.hair,
    this.eyes,
    this.mouth,
    this.chin,
    this.nose,
    this.body,
    this.skinColor,
    this.programmingLanguages,
    this.age,
    this.gender,
    this.emailOrPhone,
    this.occupation,
    this.experience,
    this.location,
    this.personalInfo,
    this.spokenLanguages,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User()
      ..userName = json['userName'] as String
      ..hair = json['hair'] as String
      ..eyes = json['eyes'] as String
      ..nose = json['nose'] as String
      ..mouth = json['mouth'] as String
      ..chin = json['chin'] as String
      ..chin = json['body'] as String
      ..skinColor = json['skinColor'] as int 
      ..spokenLanguages =
          (json['spokenLanguages'] as List)?.map((e) => e as String)?.toList()
      ..location = json['location']
      ..age = json['age'] as int
      ..programmingLanguages = (json['programmingLanguages'] as List)
          ?.map((e) => e as String)
          ?.toList()
      ..emailOrPhone = json['emailOrPhone'] as String
      ..occupation = json['occupation'] as String
      ..experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'hair': hair,
      'eyes': eyes,
      'nose': nose,
      'mouth': mouth,
      'chin': chin,
      'body' : body,
      'skinColor' : skinColor,
      'spokenLanguages': spokenLanguages,
      'location': location,
      'age': age,
      'programmingLanguages': programmingLanguages,
      'emailOrPhone': emailOrPhone,
      'occupation': occupation,
      'experience': experience
    };
  }
}
