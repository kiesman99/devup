import 'package:flutter/material.dart';

class DevUpLoader extends StatelessWidget {
  static OverlayEntry currentLoader;

  static void show(BuildContext context) {
    currentLoader = new OverlayEntry(
        builder: (context) => Stack(
              children: <Widget>[
                Container(
                  color: Color(0x99ffffff),
                ),
                Center(
                  child: DevUpLoader(),
                ),
              ],
            ));
    Overlay.of(context).insert(currentLoader);
  }

  static void hide() {
    currentLoader?.remove();
    currentLoader = null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
