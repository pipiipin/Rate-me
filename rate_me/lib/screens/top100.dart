import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:rate_me/screens/movie.dart';

class Top100Screen extends StatefulWidget {
  const Top100Screen({Key? key}) : super(key: key);

  @override
  _Top100Screen createState() => _Top100Screen();
}

class _Top100Screen extends State<Top100Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 1, 33, 105),
        title: const Text(
          'Top 100',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: const Top100List(),
      ),
    );
  }
}

class Top100List extends StatefulWidget {
  const Top100List({Key? key}) : super(key: key);
  @override
  _Top100ListState createState() => _Top100ListState();
}

class _Top100ListState extends State<Top100List> {
  List movie = [];
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

    Map topresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      movie = topresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 5,
      crossAxisSpacing: 20,
      crossAxisCount: 3,
      childAspectRatio: (2.7 / 5),
      children: List.generate(
        20,
        (index) {
          String path =
              'https://image.tmdb.org/t/p/w200' + movie[index]['poster_path'];

          String score = movie[index]['vote_average'].round().toString() + "%";
          int movieid = movie[index]['id'];
          return Card(
            margin: const EdgeInsets.only(top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieScreen(movieid: movieid)));
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
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                          child: Text(
                            movie[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.fastfood, size: 10),
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
        },
      ),
    );
  }
}
