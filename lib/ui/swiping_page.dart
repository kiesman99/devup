import 'dart:ui';

import 'package:devup/backend.dart';
import 'package:devup/components/swipe_card.dart';
import 'package:devup/model/user.dart';
import 'package:devup/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'dart:math' as math;

class SwipingPage extends StatefulWidget {

  @override
  _SwipingPageState createState() => _SwipingPageState();
}

class _SwipingPageState extends State<SwipingPage> with TickerProviderStateMixin{

  Animation<double> rotation;
  Animation<double> scale;
  Animation<double> offset;

  AnimationController _animationController;

  @override
  void initState() {

    double screenWidth = 500.0;

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));


    rotation = Tween<double>(
      begin: math.pi / 3.5,
      end: -math.pi / 3.5
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    offset = Tween<double>(
      begin: screenWidth * 2,
      end: screenWidth * -2
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    super.initState();

    _animationController.value = 0.5;
  }

  void handleNotButton(){
    _animationController.fling(velocity: 2);
  }

  Logger logger = Logger(
    printer: PrettyPrinter()
  );

  int currentIndex = 0;

  double offsetY(int position, int length) {
    if(position == 0){
      return -50.0;
    }else if(position == length - 1){
      return 80.0;
    }else {
      return 10.0;
    }
  }

  double scalee(int position, int length){
    if(position == 0){
      return 1.0;
    }else if(position == length - 1){
      return 0.8;
    }else {
      return 0.9;
    }
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _animationController.value);

  void _handleDismiss(DismissDirection direction){
    logger.i("DismissDirection: ${direction.toString()}");

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: StreamBuilder<List<User>>(
            stream: backend<DatabaseService>().matchUsers(),
            builder: (context, snapshot) {

              //logger.i("Number of Snapshots: ${snapshot.hasData ? snapshot.data.length : 0}");

              //if(snapshot.hasData && snapshot.data.length > 0) {
              if(true){
                //List<SwipingCard> cards = List.generate(snapshot.data.length, (index) {
                List<Widget> cards = List.generate(10, (index) {

                  bool firstOrLast = index == 0 || index == 1 || index == 9;

                  if(index == 0){
                    // first card

                    return GestureDetector(
                      onHorizontalDragStart: (details) => _dragStart(details),
                      onHorizontalDragUpdate: (details) => _dragUpdate(details),
                      onHorizontalDragEnd: (details) => _dragEnd(details),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child){
                          return Transform.translate(
                            offset: Offset(offset.value, 0.0),
                            child: Transform.rotate(
                              angle: rotation.value,
                              origin: Offset(0.0, 0.0),
                              child: SwipingCard.mocked(
                                hasElevation: true,
                                //user: snapshot.data[index],
                                screenSize: MediaQuery.of(context).size,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/300.png'),
                                  fit: BoxFit.cover,
                                ),
                                swipeLeft: () {
                                  setState(() {
                                    handleNotButton();
                                    _animationController.forward(from: 0.0);
                                    currentIndex++;
                                  });
                                },
                                swipeRight: () {
                                  setState(() {
                                    currentIndex++;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Container();

                }).reversed.toList();

                return Stack(
                  alignment: Alignment.center,
                  children: cards,
                );
              }
              return Container(
                child: Text("So empty in here..."),
              );
            },
          )
        ),
      )
    );
  }

  void _dragStart(DragStartDetails details) {

  }

  void _dragEnd(DragEndDetails details) {
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width; //<-- calculate the velocity of the gesture

    logger.i("Flingvelocity: $flingVelocity");

    //logger.i("Not comple");

    if (flingVelocity < 0.0)
      _animationController.fling(velocity: math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _animationController.animateTo(0.5); //<-- or just continue to whichever edge is closer
  }

  void _dragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta / MediaQuery.of(context).size.width;
  }
}

