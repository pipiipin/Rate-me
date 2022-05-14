import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
    tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Column(
            children: [
              TabBar(
                unselectedLabelColor: const Color.fromARGB(255, 189, 189, 189),
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
                          border:
                              Border.all(color: Colors.redAccent, width: 1)),
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
                          border:
                              Border.all(color: Colors.redAccent, width: 1)),
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
                          border:
                              Border.all(color: Colors.redAccent, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Watch now"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
    );
  }
}

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1 createState() => _Tab1();
}

class _Tab1 extends State<Tab1> {
  final List<String> users = [
    'Breyden Cooler',
    'Aaron Sosick',
    'Breyden Cooler',
    'Aaron Sosick',
  ];

  _commentList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Image.asset(
                        "assets/pro2.png",
                        color: null,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "That's lit!!!",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert, color: Colors.black),
                        Row(
                          children: const [
                            Text(
                              '50.4 K',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Sarala',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            Icon(
                              Icons.thumb_up,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _commentWithNPList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Image.asset(
                        "assets/pro2.png",
                        color: null,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "That's lit!!!",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert, color: Colors.black),
                        Row(
                          children: const [
                            Text(
                              '50.4 K',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Sarala',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            Icon(
                              Icons.thumb_up,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'No Spoiled'),
                    Tab(text: 'Spoiled'),
                  ],
                ),
                Container(
                  height: 600,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: [
                      _commentList(),
                      _commentWithNPList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);
  @override
  _Tab2 createState() => _Tab2();
}

class _Tab2 extends State<Tab2> {
  String firstHalf = "";
  String secondHalf = "";
  String text =
      'After half of all life is snapped away by Thanos, the Avengers are left scattered and divided. Now with a way to reverse the damage, the Avengers and their allies assemble once more and learn to put differences aside in order to work together and set things right. Along the way, the Avengers realize that sacrifices must be made as they prepare for the ultimate final showdown with Thanos, which will result in the heroes fighting the biggest battle they have ever faced.';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (text.length > 200) {
      firstHalf = text.substring(0, 200);
      secondHalf = text.substring(200, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Column(children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: secondHalf.isEmpty
                      ? Text(firstHalf)
                      : Column(
                          children: <Widget>[
                            Text(flag
                                ? (firstHalf + "...")
                                : (firstHalf + secondHalf)),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    flag ? "show more" : "show less",
                                    style: const TextStyle(color: Colors.pink),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                            ),
                          ],
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
                      color: const Color.fromARGB(255, 196, 196, 196),
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
