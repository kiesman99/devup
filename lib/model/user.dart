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

  List<String> spokenLanguages;

  GeoPoint location;
  int age;

  List<String> programmingLanguages;
  String emailOrPhone;

  String occupation;

  String gender;

  String personalInfo;

  int experience;

  User();

  factory User.fromJson(Map<String, dynamic> json) {
    return User()
      ..userName = json['userName'] as String
      ..hair = json['hair'] as String
      ..eyes = json['eyes'] as String
      ..nose = json['nose'] as String
      ..mouth = json['mouth'] as String
      ..chin = json['chin'] as String
      ..spokenLanguages =
          (json['spokenLanguages'] as List)?.map((e) => e as String)?.toList()
      ..location = json['location']
      ..age = json['age'] as int
      ..programmingLanguages = (json['programmingLanguages'] as List)
          ?.map((e) => e as String)
          ?.toList()
      ..emailOrPhone = json['emailOrPhone'] as String
      ..occupation = json['occupation'] as String
      ..experience = int.parse(json['experience']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'hair': hair,
      'eyes': eyes,
      'nose': nose,
      'mouth': mouth,
      'chin': chin,
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
