import 'package:devup/model/user.dart';
import 'package:devup/widgets/avtar_swipe_area.dart';
import 'package:devup/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

//@Justin besser immer über den packagenamen als relativ importieren
// wenn man das mischt kann get_it probleme bekommen
import 'package:devup/backend.dart';

class AvatarCreatorPage extends StatefulWidget {
  @override
  _AvatarCreatorPageState createState() => _AvatarCreatorPageState();
}

class _AvatarCreatorPageState extends State<AvatarCreatorPage> {
  Color skinColor = Color.fromRGBO(255, 204, 153, 1.0);
  Color bodyColor = Colors.blue;

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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 540,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                        child: Text(
                      'Style your Avatar by swiping hair, eyes..',
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  //Body
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 140,
                    child: AvatarSwipeArea(
                      imageAlign: Alignment.bottomCenter,
                      swipeAeraHeight: 140,
                      imageHeight: 140,
                      parts: parts.bodies,
                      customColor: bodyColor,
                    ),
                  ),
                  // Head
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 120,
                    height: 300,
                    child: AvatarSwipeArea(
                      swipeAeraHeight: 300,
                      imageAlign: Alignment.topCenter,
                      parts: parts.heads,
                      customColor: skinColor,
                    ),
                  ),
                  //Hair
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: 400,
                    child: AvatarSwipeArea(
                      swipeAeraHeight: 400,
                      parts: parts.hairs,
                      imageAlign: Alignment.topCenter,
                    ),
                  ),
                  //All others
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 150,
                    bottom: 0,
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          AvatarSwipeArea(
                            imageAlign: Alignment.center,
                            swipeAeraHeight: 80,
                            imageHeight: 30,
                            parts: parts.eyes,
                          ),
                          AvatarSwipeArea(
                            imageAlign: Alignment.topCenter,
                            swipeAeraHeight: 70,
                            imageHeight: 50,
                            parts: parts.noses,
                          ),
                          SizedBox(
                            height: 120,
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Align(
                                  alignment: Alignment(0, 0.5),
                                  child: AvatarSwipeArea(
                                    imageAlign: Alignment.center,
                                    swipeAeraHeight: 120,
                                    imageHeight: 120,
                                    parts: parts.beards,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0, -1),
                                  child: AvatarSwipeArea(
                                    imageAlign: Alignment.center,
                                    swipeAeraHeight: 70,
                                    imageHeight: 40,
                                    imageWidth: 40,
                                    parts: parts.mouths,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Skin:'),
                Material(
                  child: InkResponse(
                    onTap: () async {
                      var color = await openColorPicker(title: 'Pick a skin color', currentColor: skinColor);
                      if (color != null) {
                        setState(() {
                          skinColor = color;
                        });
                      }
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.all(12),
                      color: skinColor,
                    ),
                  ),
                ),
                Text('Body:'),
                Material(
                  child: InkResponse(
                    onTap: () async {
                      var color = await openColorPicker(title: 'Pick a body color', currentColor: bodyColor);
                      if (color != null) {
                        setState(() {
                          bodyColor = color;
                        });
                      }
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.all(12),
                      color: bodyColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar.noBackButton(),
    );
  }

  Future<Color> openColorPicker({
    String title,
    Color currentColor,
  }) async {
    return await showDialog<Color>(
      context: context,
      builder: (_) {
        Color pickedColor = currentColor;
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: SizedBox(
            height: 500,
            width: 300,
            child: ColorPicker(
              color: currentColor,
              onChanged: (color) => pickedColor = color,
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Use this'),
              onPressed: () => Navigator.of(context).pop(pickedColor),
            ),
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        );
      },
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
    email: '',
    phone: '',
    github: '',
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
    email: '',
    phone: '',
    github: '',
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
    email: '',
    phone: '',
    github: '',
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
    email: '',
    phone: '',
    github: '',
    experience: 1,
    programmingLanguages: ['Fortran', 'C', 'Dart', 'Flutter'],
    spokenLanguages: ['German'],
  ));
}
