import 'package:clone_facebook/models/user_model.dart';
import 'package:clone_facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key key, @required this.currentuser}) : super(key: key);
  final User currentuser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: currentuser.imageUrl),
          SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              currentuser.name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
