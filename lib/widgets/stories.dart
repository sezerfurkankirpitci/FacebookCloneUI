import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_facebook/config/palette.dart';
import 'package:clone_facebook/models/story_model.dart';
import 'package:clone_facebook/models/user_model.dart';
import 'package:clone_facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories(
      {Key key,
      @required this.currentUser,
      @required this.stories,
      this.bgcolor = Colors.transparent,
      this.boxShadow = false})
      : super(key: key);

  final User currentUser;
  final List<Story> stories;
  final Color bgcolor;
  final bool boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: bgcolor,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemCount: 1 + stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: StoryCard(isAddStory: true, currentUser: currentUser),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                story: story,
                boxShadow: false,
              ),
            );
          }),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard(
      {Key key,
      this.story,
      this.currentUser,
      this.isAddStory = false,
      this.boxShadow = false})
      : super(key: key);

  final bool isAddStory;
  final bool boxShadow;
  final User currentUser;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradiant,
              borderRadius: BorderRadius.circular(12),
              boxShadow: (boxShadow)
                  ? [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4.0)
                    ]
                  : null),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: Palette.facebookBlue,
                      onPressed: () {},
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                    hasBorder: !story.isViewed,
                  ))
      ],
    );
  }
}
