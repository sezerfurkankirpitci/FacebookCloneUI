import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xfff0f2f5);
  static const Color facebookBlue = Color(0xff1777f2);
  static const Color online = Color(0xff4bcb1f);

  static const LinearGradient createRoomGradiant = LinearGradient(
    colors: [
      Color(0xff496ae1),
      Color(0xffce4881),
    ],
  );


  static const LinearGradient storyGradiant = LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black26,
    ],
  );

}
