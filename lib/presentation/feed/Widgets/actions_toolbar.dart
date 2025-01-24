import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'circle_image_animation.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

  final String numLikes;
  final String numComments;
  final String userPic;
  final String numForward;

  ActionsToolbar(this.numLikes, this.numComments, this.userPic, this.numForward);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getFollowAction(pictureUrl: userPic),
        _getSocialAction(icon: 'assets/svg/heart.svg', title: numLikes),
        _getSocialAction(icon: 'assets/svg/messages.svg', title: numComments),
        _getSocialAction(icon: 'assets/svg/archive.svg', title: numComments),
        _getSocialAction(icon: 'assets/svg/forward.svg', title: numForward,),
        MusicImage(
          child: _getMusicPlayerAction(userPic),
        )
      ]),
    );
  }

  Widget _getSocialAction(
      {required String title, required String icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(children: [
          SvgPicture.asset(icon, width: 24, height: 24,),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10))
        ]));
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child:
            _getProfilePicture(pictureUrl));
  }

  Widget _getProfilePicture(userPic) {
    return Container(
        padding:
            EdgeInsets.all(1.0), // Add 1.0 point padding to create border
        height: ProfileImageSize, // ProfileImageSize = 50.0;
        width: ProfileImageSize, // ProfileImageSize = 50.0;
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10000.0),
            child: CachedNetworkImage(
              imageUrl: userPic,
              placeholder: (context, url) =>
                  new CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )));
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
        Colors.grey[800]!,
        Colors.grey[900]!,
        Colors.grey[900]!,
        Colors.grey[800]!
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction(userPic) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child:
        Image.asset(
          'assets/images/mini-music-sqaure.png'
        ));
  }
}
