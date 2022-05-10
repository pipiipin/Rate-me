import 'dart:html';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:movie_page/movieScreen.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // posthead,
            // rectangle,
            // rateAndaddToList,
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TabBar(
                      unselectedLabelColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent,
                      ),
                      controller: tabController,
                      tabs: [
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("Comment"),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("Description"),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("Watch now"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  Tab1(),
                  Tab2(),
                  Tab3(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'No Spoiled'),
                    Tab(text: 'Spoiled'),
                  ],
                ),
                Container(
                  height: 450, //height of TabBarView
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: <Widget>[
                      comment,
                      // const Center(
                      //   child: Text('Display Tab 1',
                      //       style: TextStyle(
                      //           fontSize: 22,
                      //           fontWeight: FontWeight.bold)),
                      // ),
                      commentWithsp,
                    ],
                  ),
                  // const Center(
                  //   child: Text('Display Tab 2',
                  //       style: TextStyle(
                  //           fontSize: 22,
                  //           fontWeight: FontWeight.bold)),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 5),
          alignment: Alignment.centerLeft,
          child: Column(children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "plot summary",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: ReadMoreText(
                    'After half of all life is snapped away by Thanos, the Avengers are left scattered and '
                    'divided. Now with a way to reverse the damage, the Avengers and their allies must '
                    'assemble once more and learn to put differences aside in order to work together and set '
                    'things right. Along the way, the Avengers realize that sacrifices must be made as they '
                    'prepare for the ultimate final showdown with Thanos, which will result in the heroes '
                    'fighting the biggest battle they have ever faced.',
                    trimLines: 4,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "cast & crew",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Director",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    ));
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.asset(
                "assets/netflix.png",
                color: null,
                fit: BoxFit.cover,
                width: 69.0,
                height: 69.0,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Netflix",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ]),
        Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.asset(
                "assets/disney.png",
                color: null,
                fit: BoxFit.cover,
                width: 69.0,
                height: 69.0,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Disney Plus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}

Widget comment = Column(children: [
  Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 30, top: 20),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            "assets/pro2.png",
            color: null,
            fit: BoxFit.cover,
            width: 100.0,
            height: 100.0,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Brayden cooler",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "That's lit!!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 100,
              top: 10,
            ),
            child: Row(
              children: [
                const Text(
                  '50.4 K',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Column(
                  children: const [
                    Icon(Icons.more_vert, color: Colors.black),
                    Icon(
                      Icons.thumb_up,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
  Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 30, top: 20),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            "assets/pro2.png",
            color: null,
            fit: BoxFit.cover,
            width: 100.0,
            height: 100.0,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Aaron sosick",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40),
            child: Text(
              "good job mavel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 120,
              top: 10,
            ),
            child: Row(
              children: [
                const Text(
                  '40.8 K',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Column(
                  children: const [
                    Icon(Icons.more_vert, color: Colors.black),
                    Icon(
                      Icons.thumb_up,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
]);

Widget commentWithsp = Column(children: [
  Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 30, top: 20),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            "assets/pro2.png",
            color: null,
            fit: BoxFit.cover,
            width: 100.0,
            height: 100.0,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Brayden cooler",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "Why make Tony die???",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 100,
              top: 10,
            ),
            child: Row(
              children: [
                const Text(
                  '50.4 K',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Column(
                  children: const [
                    Icon(Icons.more_vert, color: Colors.black),
                    Icon(
                      Icons.thumb_up,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
  Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 30, top: 20),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            "assets/pro2.png",
            color: null,
            fit: BoxFit.cover,
            width: 100.0,
            height: 100.0,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Aaron sosick",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 10,
            ),
            child: Text(
              "Wanda can win Thanos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 100,
              top: 10,
            ),
            child: Row(
              children: [
                const Text(
                  '40.8 K',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Column(
                  children: const [
                    Icon(Icons.more_vert, color: Colors.black),
                    Icon(
                      Icons.thumb_up,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
]);

class mentWidget extends StatelessWidget {
  const mentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
