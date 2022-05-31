import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'dart:ui';
import '../service/text.dart';
import 'package:rate_me/screens/movie.dart';

class trendMovies extends StatefulWidget {
  const trendMovies({Key? key}) : super(key: key);

  @override
  State<trendMovies> createState() => _trendMoviesState();
}

class _trendMoviesState extends State<trendMovies> {
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
            print("i see the doc");
          }
        }
      });
    });
    list.doc(doc_id).update({"historylist": FieldValue.arrayUnion(lists)});
  }

  //addmovie(movie[index]['id']);
  List trendingmovie = [];
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
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult =
        await tmdbWithCustomLogs.v3.movies.getNowPlaying(page: 2);

    setState(() {
      trendingmovie = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trending",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 168,
            color: Colors.white,
            child: (_buildYourList()),
          ),
        ],
      ),
    );
  }

  _buildYourList() {
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
              addmovie(trendingmovie[index]['id']);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieScreen(movieid: trendingmovie[index]['id'])));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        trendingmovie[index]['poster_path'],
                    width: 100,
                    height: 158,
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
}
