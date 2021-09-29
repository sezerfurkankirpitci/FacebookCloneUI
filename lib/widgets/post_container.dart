import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/models/post_model.dart';
import 'package:clone_facebook/widgets/profile_avatar.dart';
import 'package:clone_facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key key, @required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post: post),
                  SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                ],
              ),
            ),
            post.imageUrl != null
                ? SizedBox.shrink()
                : SizedBox(
              height: 6,
            ),
            post.imageUrl != null
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            )
                : SizedBox.shrink(),
            PostStats(post: post)
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} · ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 13,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  const PostStats({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Palette.facebookBlue, shape: BoxShape.circle),
                child: Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '·',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '${post.shares} Shares',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          Divider(),
          Row(children: [
            PostButton(
                icon: Icons.thumb_up_outlined, onPress: () {}, label: 'Like'),
            PostButton(
                icon: Icons.comment_outlined, onPress: () {}, label: 'Comment'),
            PostButton(
                icon: Icons.share_outlined, onPress: () {}, label: 'Share'),
          ])
        ],
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({Key key,
    @required this.icon = Icons.thumb_up,
    @required this.onPress,
    @required this.label})
      : super(key: key);

  final IconData icon;
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(label)
              ],
            )),
      ),
    );
  }
}
