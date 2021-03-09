import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  var tabController;

  void initState() {
    super.initState();
    tabController = TabController(length:2,initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Text("Hot Recommended",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        RecommendedCard(),
                        RecommendedCard(),
                        RecommendedCard(),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Text("Hot Playlists",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 30,
                        child: FlatButton(onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: Colors.white,
                          child: Text("View All",
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8)),
                GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: MediaQuery
                        .of(context)
                        .size
                        .width /
                        (MediaQuery
                            .of(context)
                            .size
                            .height / 1.5),
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      HotPlayCard(),
                      HotPlayCard(),
                      HotPlayCard(),
                      HotPlayCard()
                    ]
                ),
                Text("Our Choices For You",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
                TabBar(
                    controller: tabController,
                    indicatorColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(child: Text(
                          "Songs", style: TextStyle(color: Colors.white))),
                      Tab(child: Text(
                        "Playlists", style: TextStyle(color: Colors.white),),)
                    ]
                ),
                LimitedBox(
                  maxHeight: 400,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(
                        children: [
                          ChoiceCard(),
                          ChoiceCard(),
                          ChoiceCard(),
                          ChoiceCard(),
                          ChoiceCard(),
                          ChoiceCard()
                        ],
                      ),
                      ListView(
                        children: [
                          ChoiceCard()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),


          // Positioned(
          //   bottom: 0,
          //   child: ClipRRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.6),
          //       width: MediaQuery.of(context).size.width,
          //       child: Row(
          //         children: [
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.library_music,
          //                 title: "My Songs",
          //               )),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //               icon: Icons.history,
          //               title: "Discover")),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.album,
          //                 title: "Albums",
          //               )),
          //           Flexible(
          //               flex: 1, fit: FlexFit.tight,
          //               child: MenuItem(
          //                 icon: Icons.account_circle_outlined,
          //                 title: "Profile",
          //               )),
          //         ],
          //       )
          //     ),
          //   ),
          // )
          // )


        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/2.jpg',
              width: 70,
              height: 70,
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text("I'm Not Mad", style: TextStyle(color: Colors.white, fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Halsey", style: TextStyle(color: Colors.white70),),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [Icon(Icons.favorite_border_outlined, color: Colors.white,)],
          )
        ],
      ),
    );
  }
}



class HotPlayCard extends StatelessWidget {

  final image;

  HotPlayCard({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/3.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text("Pop List",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}


class RecommendedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/position.jpg',
                height: 200,
                width: 300,
                fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.only(top:10.0, left: 5.0),
                  child: Text("Position", style: TextStyle(color: Colors.white, fontSize: 18),)),
              Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text("Ariana Grande", style: TextStyle(color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}


