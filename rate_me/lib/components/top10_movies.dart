import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:rate_me/screens/movie.dart';

class top10 extends StatefulWidget {
  const top10({Key? key}) : super(key: key);

  @override
  State<top10> createState() => _top10State();
}

class _top10State extends State<top10> {
  List topmovie = [];
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

    Map topresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      topmovie = topresult['results'];
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
                "Top 10",
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieScreen(movieid: topmovie[index]['id'])));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        topmovie[index]['poster_path'],
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
