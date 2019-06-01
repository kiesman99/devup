import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User
{
  String id;
  String userName;
  String hair;
  String eyes;
  String nose;
  String mouth;
  String chin;
  String tShirt;

  List<String> spokenLanguages;

  double latitude;
  double longitude;

  int age;

  List<String> programmingLanguages;
  String emailOrPhone;

  String occupation;

  int experience;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);


}