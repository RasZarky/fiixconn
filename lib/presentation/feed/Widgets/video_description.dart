import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoDescription extends StatelessWidget {
  final String username;
  final String videtoTitle;
  final String songInfo;

  VideoDescription(this.username, this.videtoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    width: 112,
                    decoration: BoxDecoration(
                        color: Color(0xFF1E293B),
                        borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Row(children: [
                      SvgPicture.asset('assets/svg/shop.svg'),
                      const SizedBox(width: 8,),
                      Text('Shop',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 12.0)),
                      const SizedBox(width: 2,),
                      Icon(Icons.circle, size: 4, color: Colors.white,),
                      const SizedBox(width: 2,),
                      Text('4',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 12.0)),
                      Icon(Icons.keyboard_arrow_down, weight: 2, color: Colors.white,),
                    ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    videtoTitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E293B),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Row(children: [
                          SvgPicture.asset('assets/svg/music.svg'),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Text(songInfo,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(color: Colors.white, fontSize: 14.0)),
                          )
                        ]),
                      ),
                      const SizedBox(width: 4,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        width: 104,
                        decoration: BoxDecoration(
                            color: Color(0xFF1E293B),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Row(children: [
                          SvgPicture.asset('assets/svg/magicpen.svg'),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Text('B&W Effect',
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(color: Colors.white, fontSize: 14.0)),
                          )
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ])));
  }
}
