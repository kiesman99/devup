import 'package:devup/backend.dart';
import 'package:devup/ui/system_pages/startup_page.dart';
import 'package:flutter/material.dart';

void main() {
  initBackend();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartupPage(),
    );
  }
}
