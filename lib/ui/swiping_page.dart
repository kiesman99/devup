import 'package:devup/backend.dart';
import 'package:devup/widgets/swipe_card.dart';
import 'package:devup/model/user.dart';
import 'package:devup/services/database_service.dart';
import 'package:flutter/material.dart';

class SwipingPage extends StatefulWidget {
  @override
  _SwipingPageState createState() => _SwipingPageState();
}

class _SwipingPageState extends State<SwipingPage> {
  int currentIndex = 0;


  @override
  void initState() {
    backend<MatchingManager>().match();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: StreamBuilder<List<User>>(
            builder: (context, snapshot) {
              if(snapshot.hasData && snapshot.data.length > 0) {
                return SwipingCard(
                  user: snapshot.data[currentIndex],
                  screenSize: MediaQuery.of(context).size,
                  image: DecorationImage(
                    image: ExactAssetImage('assets/300.png'),
                    fit: BoxFit.cover,
                  ),
                  swipeLeft: () {
                    setState(() {
                      currentIndex++;
                    });
                  },
                  swipeRight: () {
                    setState(() {
                      currentIndex++;
                    });
                  },
                );
              }
              return Container();
            },
            stream: backend<MatchingManager>().activeUsers,
          )
        ),
      )
    );
  }
}