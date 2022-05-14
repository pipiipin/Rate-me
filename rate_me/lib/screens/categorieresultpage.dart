import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ResultScreen extends StatefulWidget {
  final String genre;

  const ResultScreen({Key? key, required this.genre}) : super(key: key);

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
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 1, 33, 105),
        title: Text(
          widget.genre,
          style: const TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ResultList(genre: widget.genre),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultList extends StatefulWidget {
  final String genre;
  const ResultList({Key? key, required this.genre}) : super(key: key);
  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
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

    String genreid = "0";
    if (widget.genre == "Horror") {
      genreid = "27";
    }
    if (widget.genre == "Action") {
      genreid = "28";
    }
    if (widget.genre == "Comedy") {
      genreid = "35";
    }
    if (widget.genre == "Crime") {
      genreid = "80";
    }
    if (widget.genre == "Drama") {
      genreid = "18";
    }
    if (widget.genre == "Fantasy") {
      genreid = "14";
    }
    if (widget.genre == "Science Fiction") {
      genreid = "878";
    }
    if (widget.genre == "Romance") {
      genreid = "10749";
    }
    if (widget.genre == "Adventure") {
      genreid = "12";
    }

    Map topresult =
        await tmdbWithCustomLogs.v3.discover.getMovies(withGenres: genreid);

    setState(() {
      movie = topresult['results'];
    });
  }

  _buildList() {
    return GridView.count(
      mainAxisSpacing: 5,
      crossAxisSpacing: 20,
      crossAxisCount: 3,
      childAspectRatio: (2.8 / 5),
      children: List.generate(10, (index) {
        String path =
            'https://image.tmdb.org/t/p/w200' + movie[index]['poster_path'];

        String score = movie[index]['vote_average'].round().toString() + "%";

        return Card(
          margin: const EdgeInsets.only(top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: InkWell(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const YourListScreen()));
            // },
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
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80,
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
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      children: _buildList(),
    );
  }
}
