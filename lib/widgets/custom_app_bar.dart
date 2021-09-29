import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/models/user_model.dart';
import 'package:clone_facebook/widgets/circle_button.dart';
import 'package:clone_facebook/widgets/custom_tap_bar.dart';
import 'package:clone_facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currenUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar(
      {Key key,
      @required this.currenUser,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
        ]),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'facebook',
                style: const TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2),
              ),
            ),
            Container(
                width: 600,
                child: CustomTabBar(
                    icons: icons, onTap: onTap, selectedIndex: selectedIndex,isBottomIndicator:true)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(
                    currentuser: currenUser,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CircleButton(
                    function: () {},
                    icon: Icons.search,
                  ),
                  CircleButton(function: () {}, icon: MdiIcons.facebookMessenger),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
