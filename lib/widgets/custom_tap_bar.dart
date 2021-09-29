import 'package:clone_facebook/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key key,
      @required this.icons,
      @required this.onTap,
      @required this.selectedIndex,
      this.isBottomIndicator=false})
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: !isBottomIndicator?Border(
            top: BorderSide(
              color: Palette.facebookBlue,
              width: 3,
            ),
          ):Border(
            bottom: BorderSide(
              color: Palette.facebookBlue,
              width: 3,
            ),
          ),
        ),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      e,
                      color: i == selectedIndex
                          ? Palette.facebookBlue
                          : Colors.black45,
                      size: 27,
                    ),
                  ),
                ))
            .values
            .toList());
  }
}
