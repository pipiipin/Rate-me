import 'package:flutter/material.dart';
import 'package:rate_me/components/comment.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:rate_me/screens/otherReview.dart';
import 'package:like_button/like_button.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TabBarPage extends StatefulWidget {
  final int movieid;
  const TabBarPage({Key? key, required this.movieid}) : super(key: key);

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
      height: MediaQuery.of(context).size.height / 1.05,
      child: Column(
        children: [
          Column(
            children: [
              Center(
                child: TabBar(
                  indicatorColor: Colors.white,
                  unselectedLabelColor:
                      const Color.fromARGB(255, 189, 189, 189),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(127, 204, 20, 43),
                  ),
                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Color.fromARGB(127, 204, 20, 43),
                                width: 1)),
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
                                color: Color.fromARGB(127, 204, 20, 43),
                                width: 1)),
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
                                color: Color.fromARGB(127, 204, 20, 43),
                                width: 1)),
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Tab1(),
                Tab2(movieid: widget.movieid),
                Tab3(),
              ],
            ),
          ),
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
    'Breyden Cooler',
    'Aaron Sosick',
    'Breyden Cooler',
    'Aaron Sosick',
    'Breyden Cooler',
    'Aaron Sosick',
    'Breyden Cooler',
    'Aaron Sosick',
  ];

  _commentList() {
    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 1,
      childAspectRatio: (4 / 1),
      children: List.generate(
        users.length,
        (index) {
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtherReview()));
                      },
                      child: CircleAvatar(
                        radius: 80,
                        child: Image.asset(
                          "assets/pro2.png",
                          color: null,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtherReview()));
                          },
                          child: Text(
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert, color: Colors.black),
                        LikeButton(
                          size: 30,
                          circleColor: const CircleColor(
                              start: Colors.yellow, end: Colors.amber),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.yellow,
                            dotSecondaryColor: Colors.amber,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up,
                              color: isLiked ? Colors.amber : Colors.grey,
                              size: 30,
                            );
                          },
                          likeCount: 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _commentWithNPList() {
    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 1,
      childAspectRatio: (4 / 1),
      children: List.generate(
        users.length,
        (index) {
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtherReview()));
                      },
                      child: CircleAvatar(
                        radius: 80,
                        child: Image.asset(
                          "assets/pro2.png",
                          color: null,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtherReview()));
                          },
                          child: Text(
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert, color: Colors.black),
                        LikeButton(
                          size: 30,
                          circleColor: const CircleColor(
                              start: Colors.yellow, end: Colors.amber),
                          bubblesColor:  const BubblesColor(
                            dotPrimaryColor: Colors.yellow,
                            dotSecondaryColor: Colors.amber,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up,
                              color: isLiked
                                  ? Colors.amber
                                  : Colors.grey,
                              size: 30,
                            );
                          },
                          likeCount: 0,
                          
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _displayDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const CommentScreen();
      },
      animationType: DialogTransitionType.sizeFade,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog(context);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(
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
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.white, width: 0.5))),
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
    );
  }
}

class Tab2 extends StatefulWidget {
  final int movieid;
  const Tab2({Key? key, required this.movieid}) : super(key: key);
  @override
  _Tab2 createState() => _Tab2();
}

class _Tab2 extends State<Tab2> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;
  List genre = [];
  String title = "-";
  String runtime = "-";
  String releasedate = "-";
  String rate = "-";
  String score = "-";
  String overview = "-";
  String votecount = "-";
  String posterpath = '-';
  String backdroppath = "-";
  final String apiKey = "77007faac05ec9c7ac4e6c1bd5e8c917";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwN2ZhYWMwNWVjOWM3YWM0ZTZjMWJkNWU4YzkxNyIsInN1YiI6IjYyNzI1YzVjN2NmZmRhNzMxNzljMzE5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Oo6sYnYEa0VOEciMuAL78Gt64Wc_qq1qGUlY8OB-7s";

  @override
  void initState() {
    loadtrendingmovie();
    super.initState();
  }

  loadtrendingmovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map topresult =
        await tmdbWithCustomLogs.v3.movies.getDetails(widget.movieid);

    setState(() {
      genre = topresult['genres'];
      title = topresult["original_title"];
      runtime = topresult['runtime'].toString();
      if (topresult['adult']) {
        rate = '18+';
      } else {
        rate = '12+';
      }
      releasedate = topresult['release_date'].toString();
      score = topresult['vote_average'].toString();
      overview = topresult['overview'];
      if (overview.length > 200) {
        firstHalf = overview.substring(0, 200);
        secondHalf = overview.substring(200, overview.length);
      } else {
        firstHalf = overview;
        secondHalf = "";
      }
      votecount = topresult['vote_count'].toString();
      posterpath = 'https://image.tmdb.org/t/p/w200' + topresult['poster_path'];
      backdroppath =
          'https://image.tmdb.org/t/p/w200' + topresult['backdrop_path'];
    });
  }

  _buildCCList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
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
        );
      },
    );
  }

  _buildDirectorList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "plot summary",
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "cast & crew",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: 140,
              color: Colors.white,
              child: (_buildCCList()),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Director",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: 140,
              color: Colors.white,
              child: (_buildDirectorList()),
            ),
          ]),
        ),
      ],
    ));
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({Key? key}) : super(key: key);

  _buildWatchList() {
    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      childAspectRatio: (5 / 6),
      children: List.generate(
        8,
        (index) {
          return Card(
            child: Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        "assets/netflix.png",
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Netflix",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Sarala',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height / 1,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: _buildWatchList()));
  }
}
