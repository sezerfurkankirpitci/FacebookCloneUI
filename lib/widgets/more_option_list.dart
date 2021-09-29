import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/models/user_model.dart';
import 'package:clone_facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptionList = [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'MarketPlace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Wacth'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  MoreOptionList({Key key, @required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
          itemCount: _moreOptionList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: UserCard(currentuser: currentUser),
              );
            } else {
              final List_option = _moreOptionList[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Option(
                    icon: List_option[0],
                    color: List_option[1],
                    label: List_option[2]),
              );
            }
          }),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const Option(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
