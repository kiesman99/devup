import 'package:devup/model/user.dart';
import 'package:rxdart/rxdart.dart';

import '../backend.dart';

class MatchingManager {
  /// The users that can still be used for swiping
  List<User> matchedAndNotTrashedUsers = <User>[];

  /// This Subject will emit a List of all active Users after every Swipe,
  /// at startup and when new Users are added to the database
  /// It is used by a StreamBuilder on the Swiping Page
  BehaviorSubject<List<User>> activeUsers = BehaviorSubject<List<User>>();

  MatchingManager() {
    // Start listening for updates from the Database
    backend<DatabaseService>().matchingUsersStream.listen((users) {
      matchedAndNotTrashedUsers.addAll(users);
      //push change to UI
      activeUsers.add(matchedAndNotTrashedUsers);
    });
  }

  void match() => backend<DatabaseService>().matchUsers(backend<UserManager>().currentUser);

  /// This function is called after a Swipe is done
  /// We have to try if we use the start or the end of the List as first Card
  /// and adapt this function accordingly
  /// [userId] : User that was swiped
  /// [trash]  : if the user was trashed
  /// Sidenote: we use a function here and not an RxCommand because the command would not add any
  /// benefit in that case
  void onSwipe(
    String userId,
    bool trash,
  ) {
    // remove the first user from the List
    final user = matchedAndNotTrashedUsers.removeAt(0);
    if (!trash) {
      matchedAndNotTrashedUsers.add(user);
    }
    // We don't store trashed users for now so when restarting the app you get all matching users again

    // push changes to the UI
    activeUsers.add(matchedAndNotTrashedUsers);
  }
}
