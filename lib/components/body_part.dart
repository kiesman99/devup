import 'package:devup/model/avatar_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyPart extends StatelessWidget {

  final AvatarPart avatarPart;

  BodyPart({
    @required this.avatarPart
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return IgnorePointer(
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: avatarPart.actualController,
          itemCount: avatarPart.parts.length,
          itemBuilder: (_, index){
            return Container(
              width: _screenWidth,
              child: SvgPicture.asset(
                avatarPart.resourceDir + "/" +
                    avatarPart.parts.values.elementAt(index),
                color: avatarPart.customColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
