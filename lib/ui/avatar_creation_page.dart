import 'package:devup/model/user.dart';
import 'package:devup/widgets/avtar_swipe_area.dart';
import 'package:devup/widgets/setup_navigation.dart';
import 'package:flutter/material.dart';

//@Justin besser immer über den packagenamen als relativ importieren
// wenn man das mischt kann get_it probleme bekommen
import '../backend.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {
  @override
  Widget build(BuildContext context) {
    var parts = backend<ResourceService>().avatarParts;
    return Scaffold(
      //Just for testing
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: addUsers,
      // ),
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          // Head
          Positioned(
            left: 0,
            right: 0,
            top: 75,
            height: 280,
            child: AvatarSwipeArea(
              parts: parts.heads,
              customColor: Color.fromRGBO(255, 204, 153, 1.0),
            ),
          ),
          //Hair
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 400,
            child: AvatarSwipeArea(
              parts: parts.hairs,
            ),
          ),
          //All others
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AvatarSwipeArea(
                swipeAeraHeight: 80,
                  imageHeight: 40,
                  parts: parts.eyes,
                  backgroundColor: Colors.red,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 60,
                  parts: parts.noses,
                  backgroundColor: Colors.blue,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.mouths,
                  backgroundColor: Colors.green,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.beards,
                  backgroundColor: Colors.yellow,
                ),
                AvatarSwipeArea(
                  swipeAeraHeight: 80,
                  imageHeight: 80,
                  parts: parts.bodies,
                  backgroundColor: Colors.purple,
                ),
                //Spacer(),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: SetupNavigationBar.noBackButton(
        nextPageCallback: () {},
      ),
    );
  }
}

Future<void> addUsers() async {
  await backend<DatabaseService>().saveUser(User(
    hair: 'Hair1',
    eyes: 'Eyes1',
    nose: 'Nose1',
    mouth: 'Mouth1',
    chin: 'Beard1',
    body: 'Body1',
    userName: 'user1',
    age: 23,
    skinColor: Color.fromRGBO(255, 204, 153, 1.0).value,
    gender: 'Male',
    emailOrPhone: '',
    experience: 1,
    programmingLanguages: ['Fortran', 'C', 'Dart', 'Flutter'],
    spokenLanguages: ['German'],
  ));
  await backend<DatabaseService>().saveUser(User(
    hair: 'Hair2',
    eyes: 'Eyes2',
    nose: 'Nose2',
    mouth: 'Mouth2',
    chin: 'Beard2',
    body: 'Body2',
    userName: 'user2',
    age: 23,
    skinColor: Color.fromRGBO(255, 204, 153, 1.0).value,
    gender: 'Female',
    emailOrPhone: '',
    experience: 1,
    programmingLanguages: ['Fortran', 'C'],
    spokenLanguages: ['German', 'English'],
  ));
  await backend<DatabaseService>().saveUser(User(
    hair: 'Hair3',
    eyes: 'Eyes3',
    nose: 'Nose3',
    mouth: 'Mouth3',
    chin: 'Beard3',
    body: 'Body3',
    userName: 'user3',
    age: 45,
    skinColor: Color.fromRGBO(255, 204, 153, 1.0).value,
    gender: 'Male',
    emailOrPhone: '',
    experience: 0,
    programmingLanguages: ['Flutter'],
    spokenLanguages: ['German'],
  ));
  await backend<DatabaseService>().saveUser(User(
    hair: 'Hair4',
    eyes: 'Eyes4',
    nose: 'Nose4',
    mouth: 'Mouth4',
    chin: 'Beard4',
    body: 'Body4',
    userName: 'user4',
    age: 25,
    skinColor: Color.fromRGBO(255, 204, 153, 1.0).value,
    gender: 'Female',
    emailOrPhone: '',
    experience: 1,
    programmingLanguages: ['Fortran', 'C', 'Dart', 'Flutter'],
    spokenLanguages: ['German'],
  ));
}
