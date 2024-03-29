import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:devup/widgets/selection_chip.dart';
import 'package:devup/services/resource_service.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

class ProgrammingExperiencePage extends StatefulWidget {
  final User tempUser;

  const ProgrammingExperiencePage({Key key, this.tempUser}) : super(key: key);
  @override
  _ProgrammingExperiencePageState createState() =>
      _ProgrammingExperiencePageState();
}

class _ProgrammingExperiencePageState extends State<ProgrammingExperiencePage> {
  final List<String> programmingLanguages =
      backend<ResourceService>().programmingLanguages;
  final List<String> selectedLanguages = [];

  final TextEditingController occupationController =
      new TextEditingController();

  double sliderValue = 0.0;
  final List<String> sliderValues = backend<ResourceService>().experience;

  final TextStyle headingStyle = TextStyle(fontSize: 20.0);

  @override
  void initState() {
    super.initState();
  }

  bool validate() {
    return selectedLanguages.length >= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                "Programming Languages",
                style: headingStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Wrap(
                spacing: 5,
                children: programmingLanguages
                    .map((language) => SelectionChip(
                          text: language,
                          onPressed: (selected) {
                            if (selected)
                              selectedLanguages.add(language);
                            else
                              selectedLanguages.remove(language);
                          },
                        ))
                    .toList(),
              ),
            ),
            SizedBox(),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Occupation",
                  style: headingStyle,
                  textAlign: TextAlign.start,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: occupationController,
                decoration: InputDecoration(
                    hintText: "Company/University", icon: Icon(Icons.domain)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Experience (" + sliderValues[sliderValue.toInt()] + ")",
                  style: headingStyle,
                  textAlign: TextAlign.start,
                )),
            Slider(
              value: sliderValue,
              min: 0.0,
              max: 2.0,
              divisions: 2,
              label: sliderValues[sliderValue.toInt()],
              onChanged: (value) {
                setState(() {
                  this.sliderValue = value;
                });
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
