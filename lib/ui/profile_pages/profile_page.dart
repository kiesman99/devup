
import 'package:devup/model/user.dart';
import 'package:devup/ui/profile_pages/avatar_creation_page.dart';
import 'package:devup/ui/profile_pages/personal_creation_page.dart';
import 'package:devup/ui/profile_pages/prog_creation_page.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import 'contact_creation_page.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);


  @override
  ProfilePageState createState() => ProfilePageState();

    // This is used from the child pages to access the state of this page
    // to change the current page.
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
      physics: NeverScrollableScrollPhysics(),
      children: [
      AvatarCreatorPage(),
      PersonalCreationPage(),
      ProgrammingCreationPage(),
      ContactCreationPage(),
    ],);
      
  }
}