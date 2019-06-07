

import 'package:devup/backend.dart';
import 'package:devup/model/user.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

class SwipeAction {
  final bool trash;
  final String userId;

  SwipeAction(this.trash, this.userId);
}
class UserManager {
    /// The latest Data we got from the Datase
    List<User> allUsers;
    /// When the user trashes an User we store its id in this List
    List<String> trashedUsersIds;

    BehaviorSubject<List<User>> usersToDisplay = BehaviorSubject<List<User>>();

    RxCommand<SwipeAction,void> swipeCommand;

    UserManager()
    {
      backend<DatabaseService>().matchUsers().listen( (users){

      });
    }

}
