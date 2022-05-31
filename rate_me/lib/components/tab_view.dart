import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/components/comment.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:rate_me/screens/movie.dart';
import 'package:rate_me/screens/otherReview.dart';
import 'package:like_button/like_button.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rate_me/components/popupreview.dart';

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
      height: MediaQuery.of(context).size.height / 1.10,
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
                          child: Text("Suggestion"),
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
                Tab1(movieid: widget.movieid),
                Tab2(movieid: widget.movieid),
                Tab3(movieid: widget.movieid),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tab1 extends StatefulWidget {
  final int movieid;
  const Tab1({Key? key, required this.movieid}) : super(key: key);

  @override
  _Tab1 createState() => _Tab1();
}

class _Tab1 extends State<Tab1> {
  List reviewsspoile = [];
  List reviewsnospoile = [];
  var review = FirebaseFirestore.instance.collection('moviereview');

  setdata() async {
    await review.get().then((event) {
      setState(() {
        List reviewssetspoile = [];
        List reviewssetnospoile = [];
        for (var doc in event.docs) {
          if (widget.movieid == doc.data()['movieid']) {
            if (doc.data()['spoile']) {
              reviewssetspoile.add(doc.data());
            } else {
              reviewssetnospoile.add(doc.data());
            }
          }
        }
        reviewsnospoile = reviewssetnospoile;
        reviewsspoile = reviewssetspoile;
      });
    });
  }

  _commentList() {
    setdata();

    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 1,
      childAspectRatio: (4 / 1),
      children: List.generate(
        reviewsnospoile.length,
        (index) {
          Map ref = reviewsnospoile[index];
          int cou = ref['like'];
          var imgpath = Image.asset(
            "assets/pro2.png",
          );
          if (ref['imagepath'] != null) {
            imgpath = Image.network(
              ref['imagepath'].toString(),
            );
          }
          return InkWell(
            onTap: () {
              _displayDialog2(context, ref['username'], cou, imgpath,
                  ref['text'], ref['score']);
              print(ref['score']);
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: imgpath.image,
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
                            child: Text(
                              ref['username'],
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
                          Text(
                            ref['text'],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(ref['score'].toString()),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                            ],
                          ),
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
                            likeCount: cou,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _commentWithNPList() {
    var imgpath = Image.asset(
      "assets/pro2.png",
    );
    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 1,
      childAspectRatio: (4 / 1),
      children: List.generate(
        reviewsspoile.length,
        (index) {
          Map ref = reviewsspoile[index];
          int cou = ref['like'];

          if (ref['imagepath'] != null) {
            imgpath = Image.network(
              ref['imagepath'].toString(),
            );
          }
          return InkWell(
            onTap: () {
              _displayDialog2(context, ref['username'], cou, imgpath,
                  ref['text'], ref['score']);
              print(ref['score']);
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: imgpath.image,
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
                                      builder: (context) =>
                                          const OtherReview()));
                            },
                            child: Text(
                              ref['username'],
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
                          Text(
                            ref['text'],
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
                            likeCount: cou,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
        return CommentScreen(
          movieid: widget.movieid,
        );
      },
      animationType: DialogTransitionType.sizeFade,
    );
  }

  _displayDialog2(BuildContext context, String name, int like, Image imgpath,
      String text, double score) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopupReview(
            name: name,
            like: like,
            profilepath: imgpath,
            text: text,
            score: score);
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

  var creditcast;
  var similarmv;
  loadtrendingmovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map topresult =
        await tmdbWithCustomLogs.v3.movies.getDetails(widget.movieid);
    Map credit = await tmdbWithCustomLogs.v3.movies.getCredits(widget.movieid);
    Map similar = await tmdbWithCustomLogs.v3.movies.getSimilar(widget.movieid);

    setState(() {
      similarmv = similar['results'];
      creditcast = credit['cast'];
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
    int lsssize = 10;
    if (creditcast.length <= 10) {
      lsssize = creditcast.length;
    } else {
      lsssize = 10;
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lsssize,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // child: const Image(
                  //   image: AssetImage("assets/movie_example.jpg"),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        creditcast[index]['profile_path'],
                    width: 117,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // width: MediaQuery.of(context).size.width / 6,
                        child: Text(
                          creditcast[index]['name'],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.black,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieScreen(movieid: similarmv[index]['id'])));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        similarmv[index]['poster_path'],
                    width: 117,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
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
                "Cast",
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
              height: 200,
              color: Colors.white,
              child: (_buildCCList()),
            ),
          ]),
        ),
      ],
    ));
  }
}

class Tab3 extends StatefulWidget {
  final int movieid;
  Tab3({Key? key, required this.movieid}) : super(key: key);
  @override
  _Tab3 createState() => _Tab3();
}

class _Tab3 extends State<Tab3> {
  var list = FirebaseFirestore.instance.collection('History');
  final user = FirebaseAuth.instance.currentUser!;
  addmovie(int movieid) async {
    var lists = [movieid];
    var doc_id;
    await list.get().then((event) {
      setState(() {
        for (var doc in event.docs) {
          if (user.displayName == doc.data()['usernamehist']) {
            doc_id = doc.id;
          }
        }
      });
    });
    list.doc(doc_id).update({"historylist": FieldValue.arrayUnion(lists)});
  }

  //addmovie(movie[index]['id']);
  final String apiKey = "77007faac05ec9c7ac4e6c1bd5e8c917";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwN2ZhYWMwNWVjOWM3YWM0ZTZjMWJkNWU4YzkxNyIsInN1YiI6IjYyNzI1YzVjN2NmZmRhNzMxNzljMzE5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Oo6sYnYEa0VOEciMuAL78Gt64Wc_qq1qGUlY8OB-7s";

  @override
  void initState() {
    loadtrendingmovie();
    super.initState();
  }

  var similarmv;
  loadtrendingmovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map similar = await tmdbWithCustomLogs.v3.movies.getSimilar(widget.movieid);
    setState(() {
      similarmv = similar['results'];
    });
  }

  _buildWatchList() {
    return GridView.count(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      childAspectRatio: (5 / 6),
      children: List.generate(
        20,
        (index) {
          return Card(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: InkWell(
              onTap: () {
                addmovie(similarmv[index]['id']);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MovieScreen(movieid: similarmv[index]['id'])));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // child: const Image(
                    //   image: AssetImage("assets/movie_example.jpg"),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200' +
                          similarmv[index]['poster_path'],
                      width: 90,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Text(
                            similarmv[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
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
            height: MediaQuery.of(context).size.height * 2,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: _buildWatchList()));
  }
}
