import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'circle_image_animation.dart';

class ActionsToolbar extends StatelessWidget {
  static const double actionWidgetSize = 60.0;

  static const double actionIconSize = 35.0;

  static const double shareActionIconSize = 25.0;

  static const double profileImageSize = 50.0;

  final String numLikes;
  final String numComments;
  final String userPic;
  final String numForward;

  const ActionsToolbar(this.numLikes, this.numComments, this.userPic, this.numForward, {super.key});

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
      {required String title, required String icon}) {
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
            EdgeInsets.all(1.0),
        height: profileImageSize,
        width: profileImageSize,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10000.0),
            child: CachedNetworkImage(
              imageUrl: userPic,
              placeholder: (context, url) =>
                  CircularProgressIndicator(),
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
        width: actionWidgetSize,
        height: actionWidgetSize,
        child:
        Image.asset(
          'assets/images/mini-music-sqaure.png'
        ));
  }
}
