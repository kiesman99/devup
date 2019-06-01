import 'package:flutter/material.dart';

class ContactCreationPage extends StatefulWidget {
  @override
  _ContactCreationPageState createState() => _ContactCreationPageState();
}

class _ContactCreationPageState extends State<ContactCreationPage> {
  final TextStyle headingStyle = TextStyle(
    fontSize: 20.0
  );

  final TextEditingController githubController = new TextEditingController();
  final TextEditingController telephoneController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Contact Information",
                style: headingStyle,
                textAlign: TextAlign.start,
              )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                maxLength: 50,
                controller: githubController,
                decoration: InputDecoration(
                  hintText: "Github Username",
                  icon: Icon(
                    Icons.account_circle
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                maxLength: 50,
                keyboardType: TextInputType.number,
                controller: telephoneController,
                decoration: InputDecoration(
                  hintText: "Telephone Number",
                  icon: Icon(
                    Icons.local_phone
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                maxLength: 50,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  icon: Icon(
                    Icons.mail
                  )
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}