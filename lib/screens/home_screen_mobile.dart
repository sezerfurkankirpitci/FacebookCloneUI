import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/data/data.dart';
import 'package:clone_facebook/models/post_model.dart';
import 'package:clone_facebook/widgets/circle_button.dart';
import 'package:clone_facebook/widgets/create_post_container.dart';
import 'package:clone_facebook/widgets/post_container.dart';
import 'package:clone_facebook/widgets/responsive.dart';
import 'package:clone_facebook/widgets/rooms.dart';
import 'package:clone_facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key key, @required this.scrollController}) : super(key: key);
  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        if (!Responsive.isDesktop(context))
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                function: () {},
                icon: Icons.search,
              ),
              CircleButton(function: () {}, icon: MdiIcons.facebookMessenger),
            ],
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
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
              bgcolor: Colors.white,
            ),
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}
