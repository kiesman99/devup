import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:devup/ui/profile_pages/avatar_creation_page.dart';
import 'package:devup/ui/profile_pages/email_password_page.dart';
import 'package:devup/ui/profile_pages/personal_creation_page.dart';
import 'package:devup/ui/profile_pages/programming_experience_page.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import 'contact_creation_page.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  // flag to signal the page if its in edit or creation mode
  final bool createProfile;

  /// if true a extra startpage is added to enter email an password
  final bool createProfileByEmailPassword;

  const ProfilePage({
    Key key,
    this.createProfile,
    this.createProfileByEmailPassword,
    this.user,
  }) : super(key: key);

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
  int _maxPages;
  User _tempUser;

  @override
  void initState() {
    _maxPages = widget.createProfileByEmailPassword ? 4 : 3;
    _tempUser = widget.user.copyWith();

    super.initState();
  }

  void prevPage() {
    if (_controller.page > 0.0) {
      unawaited(_controller.previousPage(
          duration: kThemeAnimationDuration, curve: Curves.fastOutSlowIn));
    }
  }

  void nextPage() {
    if (_controller.page < _maxPages) {
      unawaited(_controller.nextPage(
          duration: kThemeAnimationDuration, curve: Curves.fastOutSlowIn));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !widget.createProfile, // on first startup don't allow to pop
      child: SafeArea(
        child: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            if (widget.createProfileByEmailPassword)
              EmailPasswordPage(
                tempUser: _tempUser,
              ),
            AvatarCreatorPage(
              tempUser: _tempUser,
            ),
            PersonalCreationPage(
              tempUser: _tempUser,
            ),
            ProgrammingExperiencePage(tempUser: _tempUser),
            ContactCreationPage(
              tempUser: _tempUser,
              onSaveUser: backend.get<UserManager>().updateUserCommand,
            ),
          ],
        ),
      ),
    );
  }
}
