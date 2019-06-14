// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserJsonSerializer implements Serializer<User> {
  final _passProcessor = const PassProcessor();
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'userName', model.userName);
    setMapValue(ret, 'hair', model.hair);
    setMapValue(ret, 'eyes', model.eyes);
    setMapValue(ret, 'nose', model.nose);
    setMapValue(ret, 'mouth', model.mouth);
    setMapValue(ret, 'chin', model.chin);
    setMapValue(ret, 'body', model.body);
    setMapValue(ret, 'skinColor', model.skinColor);
    setMapValue(ret, 'bodyColor', model.bodyColor);
    setMapValue(ret, 'spokenLanguages',
        codeIterable(model.spokenLanguages, (val) => val as String));
    setMapValue(ret, 'location', _passProcessor.serialize(model.location));
    setMapValue(ret, 'age', model.age);
    setMapValue(ret, 'programmingLanguages',
        codeIterable(model.programmingLanguages, (val) => val as String));
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'phone', model.phone);
    setMapValue(ret, 'github', model.github);
    setMapValue(ret, 'occupation', model.occupation);
    setMapValue(ret, 'gender', model.gender);
    setMapValue(ret, 'personalInfo', model.personalInfo);
    setMapValue(ret, 'experience', model.experience);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = User();
    obj.id = map['id'] as String;
    obj.userName = map['userName'] as String;
    obj.hair = map['hair'] as String;
    obj.eyes = map['eyes'] as String;
    obj.nose = map['nose'] as String;
    obj.mouth = map['mouth'] as String;
    obj.chin = map['chin'] as String;
    obj.body = map['body'] as String;
    obj.skinColor = map['skinColor'] as int;
    obj.bodyColor = map['bodyColor'] as int;
    obj.spokenLanguages = codeIterable<String>(
        map['spokenLanguages'] as Iterable, (val) => val as String);
    obj.location = _passProcessor.deserialize(map['location']) as GeoPoint;
    obj.age = map['age'] as int;
    obj.programmingLanguages = codeIterable<String>(
        map['programmingLanguages'] as Iterable, (val) => val as String);
    obj.email = map['email'] as String;
    obj.phone = map['phone'] as String;
    obj.github = map['github'] as String;
    obj.occupation = map['occupation'] as String;
    obj.gender = map['gender'] as String;
    obj.personalInfo = map['personalInfo'] as String;
    obj.experience = map['experience'] as int;
    return obj;
  }
}
