import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/data/data.dart';
import 'package:clone_facebook/models/post_model.dart';
import 'package:clone_facebook/widgets/circle_button.dart';
import 'package:clone_facebook/widgets/contact_list.dart';
import 'package:clone_facebook/widgets/create_post_container.dart';
import 'package:clone_facebook/widgets/more_option_list.dart';
import 'package:clone_facebook/widgets/post_container.dart';
import 'package:clone_facebook/widgets/responsive.dart';
import 'package:clone_facebook/widgets/rooms.dart';
import 'package:clone_facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({Key key, @required this.scrollController})
      : super(key: key);
  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(padding: EdgeInsets.all(8),
            child: MoreOptionList(currentUser: currentUser,),
          ),
        ),
        Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 5),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                    boxShadow: true,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(
                  user: currentUser,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(12),
            child: ContactList(users: onlineUsers),
          ),
        )
      ],
    );
  }
}
