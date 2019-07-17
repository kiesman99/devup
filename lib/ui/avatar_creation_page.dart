import 'package:devup/model/user.dart';
import 'package:devup/ui/profile_pages/navigation.dart';
import 'package:devup/widgets/avtar_swipe_area.dart';
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
          children: <Widget>[
            // Head
            Positioned(
              left: 0,
              right: 0,
              top: 140,
              height: 300,
              child: AvatarSwipeArea(
                swipeAeraHeight: 300,
                imageAlign: Alignment.topCenter,
                parts: parts.heads,
                customColor: Color.fromRGBO(255, 204, 153, 1.0),
                backgroundColor: Colors.blue,
              ),
            ),
            //Hair
            Positioned(
              left: 0,
              right: 0,
              top: 20,
              height: 400,
              child: AvatarSwipeArea(
                swipeAeraHeight: 400,
                parts: parts.hairs,
                imageAlign: Alignment.topCenter,
              ),
            ),
            //Body
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 120,
              child: AvatarSwipeArea(
                imageAlign: Alignment.bottomCenter,
                swipeAeraHeight: 120,
                imageHeight: 120,
                parts: parts.bodies,
              ),
            ),
            //All others
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   top: 150,
            //   bottom: 0,
            //   child: Container(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         SizedBox(
            //           height: 30,
            //         ),
            //         AvatarSwipeArea(
            //           imageAlign: Alignment.center,
            //           swipeAeraHeight: 80,
            //           imageHeight: 30,
            //           parts: parts.eyes,
            //         ),
            //         AvatarSwipeArea(
            //           imageAlign: Alignment.topCenter,
            //           swipeAeraHeight: 80,
            //           imageHeight: 50,
            //           parts: parts.noses,
            //         ),
            //         Container(color: Colors.blue,
            //           height: 200,
            //           child: Stack(
            //             children: [
            //               AvatarSwipeArea(
            //                 imageAlign: Alignment.bottomCenter,
            //                 swipeAeraHeight: 120,
            //                 imageHeight: 120,
            //                 parts: parts.beards,
            //               ),
            //               AvatarSwipeArea(
            //                 imageAlign: Alignment.center,
            //                 swipeAeraHeight: 50,
            //                 parts: parts.mouths,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar.noBackButton(
      ),
    );
  }
}

Future<void> addUsers() async {
  await backend<DatabaseService>().updateUser(User(
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
    email: '',
    phone: '',
    bodyColor: Colors.red.value,
    experience: 1,
    programmingLanguages: ['Fortran', 'C', 'Dart', 'Flutter'],
    spokenLanguages: ['German'],
  ));
  await backend<DatabaseService>().updateUser(User(
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
    email: '',
    phone: '',
    bodyColor: Colors.blue.value,
    experience: 1,
    programmingLanguages: ['Fortran', 'C'],
    spokenLanguages: ['German', 'English'],
  ));
  await backend<DatabaseService>().updateUser(User(
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
    email: '',
    phone: '',
    bodyColor: Colors.green.value,
    experience: 0,
    programmingLanguages: ['Flutter'],
    spokenLanguages: ['German'],
  ));
  await backend<DatabaseService>().updateUser(User(
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
    email: '',
    phone: '',
    bodyColor: Colors.purple.value,
    experience: 1,
    programmingLanguages: ['Fortran', 'C', 'Dart', 'Flutter'],
    spokenLanguages: ['German'],
  ));
}
