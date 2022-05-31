import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/screens/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:rate_me/screens/default.dart';

class ResultScreen extends StatefulWidget {
  final String searchword;

  const ResultScreen({Key? key, required this.searchword}) : super(key: key);

  @override
  _ResultScreen createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DefaultScreen()))),
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 1, 33, 105),
        title: Text(
          "Search : " + widget.searchword,
          style: const TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ResultList(searchword: widget.searchword),
      ),
    );
  }
}

class ResultList extends StatefulWidget {
  final String searchword;
  const ResultList({Key? key, required this.searchword}) : super(key: key);
  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
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

  var movie = [];
  var topmovie = [];
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
        await tmdbWithCustomLogs.v3.search.queryMovies(widget.searchword);

    setState(() {
      movie = topresult['results'];
      print(movie.toString());
    });

    // for (int i = 0; i < movie.length; i++) {
    //   findmovie(i);
    //   print(i);
    // }
    // print(topmovie.length);
  }

  // findmovie(int index) async {
  //   TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
  //       logConfig: const ConfigLogger(
  //         showLogs: true,
  //         showErrorLogs: true,
  //       ));
  //   print(movie[index]['id']);
  //   int movieid = movie[index]['id'];
  //   Map topresult = await tmdbWithCustomLogs.v3.movies.getDetails(movieid);
  //   if (topresult != null) {
  //     topmovie.add(topresult);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 22,
      crossAxisCount: 3,
      childAspectRatio: (2.7 / 5),
      children: List.generate(movie.length, (index) {
        String path =
            'https://image.tmdb.org/t/p/w200' + movie[index]['poster_path'];

        String score = movie[index]['vote_average'].toString();

        return Card(
          margin: const EdgeInsets.only(top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              addmovie(movie[index]['id']);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieScreen(movieid: movie[index]['id'])));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // child: const Image(
                  //   image: AssetImage("assets/movie_example.jpg"),
                  child: Image.network(
                    path,
                    width: 117,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: Text(
                          movie[index]['title'].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.people, size: 10),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            score,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
