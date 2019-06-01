import 'package:devup/backend.dart';
import 'package:devup/components/choice_chips.dart';
import 'package:devup/components/selection_chip.dart';
import 'package:devup/services/resource_service.dart';
import 'package:flutter/material.dart';

class PersonalCreationPage extends StatefulWidget {
  @override
  _PersonalCreationPageState createState() => _PersonalCreationPageState();
}

class _PersonalCreationPageState extends State<PersonalCreationPage> {
  final TextStyle headingStyle = TextStyle(
    fontSize: 20.0
  );

  final List<String> languages = backend<ResourceService>().languages;
  final List<String> selectedLanguages = [];
  final List<String> genders = backend<ResourceService>().genders;
  String selectedGender;

  final TextEditingController personalInfoController = new TextEditingController();

  bool validation() {
    return selectedLanguages.length >= 1;
  }

  @override
  void initState() {
    super.initState();
    selectedGender = genders[2];
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
                "Languages",
                style: headingStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Wrap(
                spacing: 5,
                children: List.generate(languages.length, (index) {
                  final String language = languages[index];
                  return SelectionChip(
                    text: language,
                    onPressed: (selected) {
                      if(selected)
                        selectedLanguages.add(language);
                      else
                        selectedLanguages.remove(language);
                    },
                  );
                }),
              ),
            ),
            SizedBox(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                "Gender",
                style: headingStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ChoiceChips(
                choices: genders,
                selected: 2,
                onPressed: (selection) {
                  selectedGender = selection;
                },
              ),
            ),
            SizedBox(),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Personal Information",
                style: headingStyle,
                textAlign: TextAlign.start,
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                maxLength: 50,
                controller: personalInfoController,
                decoration: InputDecoration(
                  hintText: "Write something about yourself",
                  icon: Icon(
                    Icons.account_circle
                  )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}