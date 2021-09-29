import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key key,
      @required this.icon,
      @required this.function,
      this.iconSize = 28.0,
      this.iconColor = Colors.black})
      : super(key: key);

  final IconData icon;
  final Function function;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        onPressed: function,
        iconSize: iconSize,
        color: iconColor,
        icon: Icon(icon),
      ),
    );
  }
}
