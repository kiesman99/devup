// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userName = json['userName'] as String
    ..hair = json['hair'] as String
    ..eyes = json['eyes'] as String
    ..nose = json['nose'] as String
    ..mouth = json['mouth'] as String
    ..chin = json['chin'] as String
    ..tShirt = json['tShirt'] as String
    ..spokenLanguages =
        (json['spokenLanguages'] as List)?.map((e) => e as String)?.toList()
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..longitude = (json['longitude'] as num)?.toDouble()
    ..age = json['age'] as int
    ..programmingLanguages = (json['programmingLanguages'] as List)
        ?.map((e) => e as String)
        ?.toList()
    ..emailOrPhone = json['emailOrPhone'] as String
    ..occupation = json['occupation'] as String
    ..experience = json['experience'] as int;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'hair': instance.hair,
      'eyes': instance.eyes,
      'nose': instance.nose,
      'mouth': instance.mouth,
      'chin': instance.chin,
      'tShirt': instance.tShirt,
      'spokenLanguages': instance.spokenLanguages,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'age': instance.age,
      'programmingLanguages': instance.programmingLanguages,
      'emailOrPhone': instance.emailOrPhone,
      'occupation': instance.occupation,
      'experience': instance.experience
    };
