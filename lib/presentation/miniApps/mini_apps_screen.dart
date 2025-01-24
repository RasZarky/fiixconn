import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MiniAppsScreen extends StatefulWidget {
  const MiniAppsScreen({super.key});

  @override
  State<MiniAppsScreen> createState() => _MiniAppsScreenState();
}

class _MiniAppsScreenState extends State<MiniAppsScreen> {

  bool isDark = true;
  
  Widget _buildGameCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(height: 8.0),
          Text(title, style:
          TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: isDark ? Color(0xFFF0F4F8) : Color(0xFF1E293B),),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget( String title,
   String subtitle,
   String imagePath,) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 64.0,
          height: 64.0,
        ),
        SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style:
            TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: isDark ? Color(0xFFF0F4F8) : Color(0xFF1E293B) ),
            ),
            Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: isDark ? Color(0xFF93A2B7) : Color(0xFF475569),),),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    TextStyle mainText = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: isDark ? Color(0xFFE1E7EF) : Color(0xFF1E293B)
    );

    TextStyle subtitleText = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: isDark ? Color(0xFF93A2B7) : Color(0xFF475569)
    );

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/mini-apps.png", fit: BoxFit.cover, width: MediaQuery.of(context).size.width,),
                const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending',
                      style: mainText
                    ),
                    Text(
                      'Trending games from 30 days',
                      style: subtitleText
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      height: 140.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Ensures horizontal scrolling
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final gameData = data[index];
                          return _buildGameCard(
                            gameData['image'], gameData['title'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 32.0),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: mainText
                      ),
                      SizedBox(height: 12.0),
                    SizedBox(
                      height: 208,
                      child:  GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 180.0,
                          crossAxisSpacing: 8.0,
                          crossAxisCount: 3,
                          childAspectRatio: 0.36,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return _itemWidget(
                            data[index]['title'],
                            data[index]['subtitle'],
                             data[index]['image'],
                          );
                        },
                      ),
                    ),
                    ],
                  ),
                ),

                SizedBox(height: 32.0),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recently opened',
                        style: mainText
                      ),
                      Text(
                        'Here are some of your recently played games',
                        style: subtitleText
                      ),
                      SizedBox(height: 12.0),
                      SizedBox(
                        height: 140.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal, // Ensures horizontal scrolling
                          itemCount: 5, // Replace with actual number of trending games
                          itemBuilder: (context, index) {
                            final gameData = data[index];
                            return _buildGameCard(
                              gameData['image'], gameData['title'],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 70.0),

              ],
            ),
          ),
          Container(
            height: 105,
            color: Color(0xFFF0F4F8).withValues(alpha: isDark ? .1 : .5),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){ if(Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }},
                    child: SvgPicture.asset(
                      'assets/svg/arrow-left.svg',
                      color: isDark ? Color(0xFFE1E7EF) : Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    'Mini Apps',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: isDark ? Color(0xFFF0F4F8) : Color(0xFF1E293B),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/search.svg',
                        color: isDark ? Color(0xFFE1E7EF) : Color(0xFF1E293B),
                      ),
                      SizedBox(width: 12,),
                      SvgPicture.asset(
                        'assets/svg/ranking.svg',
                        color: isDark ? Color(0xFFE1E7EF) : Color(0xFF1E293B),
                      ),
                      SizedBox(width: 12,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        child: Container(
                            padding:
                            EdgeInsets.all(1.0), // Add 1.0 point padding to create border
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: isDark ? Color(0xFFE1E7EF) : Color(0xFF1E293B),
                                borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10000.0),
                                child: CachedNetworkImage(
                                  imageUrl: "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
                                  placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> data = [
  {'image': 'assets/images/game1.png', 'title': 'Game 1', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game2.png', 'title': 'Game 2', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game3.png', 'title': 'Game 3', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game4.png', 'title': 'Game 4', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game3.png', 'title': 'Game 7', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game4.png', 'title': 'Game 8', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game3.png', 'title': 'Game 7', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game4.png', 'title': 'Game 8', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game5.png', 'title': 'Game 9', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game6.png', 'title': 'Game 10', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game1.png', 'title': 'Game 11', 'subtitle' : 'Hello gme'},
  {'image': 'assets/images/game2.png', 'title': 'Game 12', 'subtitle' : 'Hello gme'},
];