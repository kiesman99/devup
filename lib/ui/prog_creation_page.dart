import 'package:devup/components/selection_chip.dart';
import 'package:flutter/material.dart';

class ProgrammingCreationPage extends StatefulWidget {
  @override
  _ProgrammingCreationPageState createState() => _ProgrammingCreationPageState();
}

class _ProgrammingCreationPageState extends State<ProgrammingCreationPage> {
  final List<String> programmingLanguages = ["CSS", "PHP", "JS", "Java", "Python", "Dart", "C++", "C", "C#", "F#", "R", "Ruby"];
  final List<String> selectedLanguages = [];

  final TextEditingController occupationController = new TextEditingController();

  double sliderValue = 0.0;
  final List<String> sliderValues = ["Beginner", "Intermediate", "Advanced"];

  final TextStyle headingStyle = TextStyle(
    fontSize: 20.0
  );

  @override
  void initState() {
    super.initState();
  }

  bool validate() {
    return selectedLanguages.length >= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
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
                children: List.generate(programmingLanguages.length, (index) {
                  final String language = programmingLanguages[index];
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
              margin: EdgeInsets.all(10),
              child: Text(
                "Occupation",
                style: headingStyle,
                textAlign: TextAlign.start,
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: occupationController,
                decoration: InputDecoration(
                  hintText: "Company/University",
                  icon: Icon(
                    Icons.domain
                  )
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Experience (" + sliderValues[sliderValue.toInt()] + ")" ,
                style: headingStyle,
                textAlign: TextAlign.start,
              )
            ),
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
            ),
          ],
        ),
      )
    );
  }
}