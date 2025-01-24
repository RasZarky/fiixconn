import 'package:fiixconn/presentation/feed/Widgets/bottom_bar.dart';
import 'package:fiixconn/presentation/feed/Widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import '../../data/video.dart';
import 'Widgets/actions_toolbar.dart';
import 'Widgets/video_description.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

int videoPlaying = 0;

class _FeedScreenState extends State<FeedScreen> {



  @override
  void initState() {
    loadVideo(0);
    loadVideo(1);

    super.initState();
  }

  void loadVideo(int index) async {
    if (videos.length > index) {
      await videos[index].loadController();
      videos[index].controller?.play();
      setState(() {
        videoPlaying = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: feedVideos(),
      bottomNavigationBar: BottomBar(
        context: context, pause: videos[videoPlaying].controller!.pause(),
      ),
    );
  }
}

Widget feedVideos() {
  int prevVideo = 0;
  return Stack(
    children: [
      PageView.builder(
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
        ),
        itemCount: data.length,
        onPageChanged: (index) async {
          index = index % (data.length);
          if (videos[index].controller == null) {
            await videos[index].loadController();
          }
          videoPlaying = index;
          videos[index].controller!.play();

          if (videos[prevVideo].controller != null) {
            videos[prevVideo].controller!.pause();
            videoPlaying = prevVideo;
          }

          prevVideo = index;
        },
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          index = index % (data.length);
          return videoCard(videos[index]);
        },
      ),
      SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/menu.svg',
                ),
                DefaultTabController(
                  length: 3,
                  initialIndex: 2,
                  child: SizedBox(width: 300, height: 26, child: MyTabBar()),
                ),
                SvgPicture.asset(
                  'assets/svg/search.svg',
                ),
              ]),
        ),
      ),
    ],
  );
}

Widget videoCard(Video video) {
  return Stack(
    children: [
      video.controller != null
          ? GestureDetector(
              onTap: () {
                if (video.controller!.value.isPlaying) {
                  video.controller?.pause();
                } else {
                  video.controller?.play();
                }
              },
              child: SizedBox.expand(
                  child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: video.controller?.value.size.width ?? 0,
                  height: video.controller?.value.size.height ?? 0,
                  child: VideoPlayer(video.controller!),
                ),
              )),
            )
          : Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loading", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                  SizedBox(height: 8,),
                  SpinKitCubeGrid(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              VideoDescription(video.user, video.videoTitle, video.songName),
              ActionsToolbar(
                  video.likes,
                  video.comments,
                  "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
                  video.shares),
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    ],
  );
}

var data = [
  {
    "id": "2",
    "video_title": "Vacation",
    "url": "assets/videos/video2.mp4",
    "comments": "143",
    "shares": "45",
    "likes": "67",
    "song_name": "falz - How many",
    "user": "Abdul Razak",
    "user_pic":
    "https://i.pinimg.com/originals/5e/eb/8d/5eeb8d615bea040425f9937699392751.jpg"
  },
  {
    "id": "1",
    "video_title": "Glass of water",
    "url": "assets/videos/video1.mp4",
    "comments": "143",
    "shares": "7",
    "likes": "323",
    "song_name": "Shatta wale - Nice song",
    "user": "Adom Hamza",
    "user_pic":
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"
  },
  {
    "id": "3",
    "video_title": "Testing my camera",
    "shares": "56",
    "url": "assets/videos/video3.mp4",
    "comments": "143",
    "likes": "32",
    "song_name": "Song 3 - Artist 3",
    "user": "Black Sherif",
    "user_pic":
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"
  },
];

List<Video> videos = Video.fromJsonList(data);
