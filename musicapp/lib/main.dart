import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/screens/test.dart';
import 'package:musicapp/screens/test2.dart';
import 'package:musicapp/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/test': (BuildContext context) => Test(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  var tabController;

  int currentIndex = 0;
  List pages = [MyHomePage(), Test(), Test2()];


  @override
  void initState() {
    super.initState();
    tabController = TabController(length:2,initialIndex: 0, vsync: this);
  }

    int _selectedItemIndex = 0;


  @override
  Widget build(BuildContext context) {



    // Widget bottomNavBar = BottomNavigationBar(
    //     currentIndex: currentIndex,
    //     onTap: (int index){
    //       setState(() {
    //         currentIndex = index;
    //       });
    //     },
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    //       BottomNavigationBarItem(icon: Icon(Icons.music_note_rounded), title: Text("Favourite")),
    //       BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
    //
    //     ]);



    return Scaffold(
      // bottomNavigationBar: bottomNavBar,
        // bottomNavigationBar: Row(
        //   children: <Widget>[
        //    buildNavBarItem(Icons.home, true, 0),
        //     buildNavBarItem(Icons.library_music, false, 1),
        //     buildNavBarItem(Icons.account_circle, false, 2),
        //
        //   ],
        // ),
        //

    backgroundColor: Colors.black,
    appBar: AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
    },),
    title: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.5)
      ),
        child: TextField(
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(Icons.search, color: Colors.white,),
              ),
              hintText: "Search album, song..."
            ),
        )
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
          child: Image.asset('assets/pug.jpg', width: 50.0, height: 50.0, fit: BoxFit.cover,)
    )
    )
    ],
    ),
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
                        child: FlatButton(onPressed: (){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
                  childAspectRatio: MediaQuery.of(context).size.width/
                      (MediaQuery.of(context).size.height/1.5),
                  physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [HotPlayCard(), HotPlayCard(), HotPlayCard(), HotPlayCard()]
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
                      Tab(child: Text("Songs", style: TextStyle(color: Colors.white))),
                      Tab(child: Text("Playlists", style: TextStyle(color: Colors.white),),)
                    ]
                ),
                LimitedBox(
                  maxHeight: 400,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(
                        children: [
                          ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard(), ChoiceCard()
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

  // Container buildNavBarItem(IconData icon, bool isActive, int index){
  //   return  Container(
  //     height: 60,
  //     width: MediaQuery.of(context).size.width/3,
  //     decoration: BoxDecoration(
  //         color: index == _selectedItemIndex ? Colors.pink : Colors.black
  //     ),
  //     child: Icon(icon, color: Colors.white,),
  //   );
  }





// class MenuItem extends StatelessWidget {
//   final icon;
//   final title;
//   MenuItem({this.icon, this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: (){
//           Navigator.of(context).pop();
//           Navigator.of(context).pushNamed('/test');
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 10, bottom: 15),
//           child: Column(
//             children: [Icon(icon, color: Colors.white70,), Text(title, style: TextStyle(color: Colors.white),)],
//           ),
//         ),
//       ),
//     );
//   }
// }


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

