import 'package:devup/ui/avatar_creation_page.dart';
import 'package:devup/ui/personal_creation_page.dart';
import 'package:devup/ui/prog_creation_page.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import 'contact_creation_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();

    static ProfilePageState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<ProfilePageState>());
  }
}

class ProfilePageState extends State<ProfilePage> {
  final _controller = PageController();

  void prevPage()
  {
    if ( _controller.page > 0.0)
    {
      unawaited(_controller.previousPage(duration: kThemeAnimationDuration, curve: Curves.fastOutSlowIn));
    }
  }

  void nextPage()
  {
    if ( _controller.page < 3.0)
    {
      unawaited(_controller.nextPage(duration: kThemeAnimationDuration, curve: Curves.fastOutSlowIn));
    }
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
     // physics: NeverScrollableScrollPhysics(),
      children: [
      AvatarCreatorPage(),
      PersonalCreationPage(),
      ProgrammingCreationPage(),
      ContactCreationPage(),
    ],);
      
  }
}