// ignore_for_file: avoid_unnecessary_containers
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/components/tab_view.dart';
import 'package:like_button/like_button.dart';

class MovieScreen extends StatefulWidget {
  final int movieid;
  const MovieScreen({Key? key, required this.movieid}) : super(key: key);
  @override
  State<MovieScreen> createState() => _MovieScreen();
}

class _MovieScreen extends State<MovieScreen> {
  bool selected = false;
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
      title = topresult["title"];
      runtime = topresult['runtime'].toString();
      if (topresult['adult']) {
        rate = '18+';
      } else {
        rate = '12+';
      }
      releasedate = topresult['release_date'].toString();
      score = topresult['vote_average'].toString();
      overview = topresult['overview'];
      votecount = topresult['vote_count'].toString();
      posterpath = 'https://image.tmdb.org/t/p/w200' + topresult['poster_path'];
      backdroppath =
          'https://image.tmdb.org/t/p/w500' + topresult['backdrop_path'];
    });
  }

  posthead() {
    print(posterpath);
    return Container(
      width: double.maxFinite,
      height: 300,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(137, 0, 0, 0),
            offset: Offset(0.0, 4.0),
            blurRadius: 28.0,
          )
        ],
      ),
      child: Container(
        child: Image.network(
          backdroppath,
          fit: BoxFit.cover,
          color: Colors.white.withOpacity(0.6),
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }

  rectangle() {
    print(widget.movieid);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: SizedBox(
          child: ClipRRect(
            child: Image.network(
              posterpath,
              fit: BoxFit.cover,
              width: 120.0,
              height: 175.0,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
        )),
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.8,
          height: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Duration : " + runtime + " minute",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Release date : " + releasedate,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rate : " + rate,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                      child: const Text(
                        "horror",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(127, 204, 20, 43),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                      child: const Text(
                        "drama",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(127, 204, 20, 43),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }

  rateAndaddToList() {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 59.0,
                height: 59.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    "assets/ratepopcorn.png",
                    color: null,
                    fit: BoxFit.cover,
                    width: 59.0,
                    height: 59.0,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                score,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 2,
                  fontSize: 24.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Number of visitors",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  votecount,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              LikeButton(
                size: 35,
                circleColor: CircleColor(
                    start: Color.fromARGB(255, 115, 115, 115),
                    end: Colors.black),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color.fromARGB(255, 75, 75, 75),
                  dotSecondaryColor: Color.fromARGB(255, 0, 0, 0),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked ? Icons.check : Icons.add,
                    color: isLiked ? Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                    size: 35,
                  );
                },
              ),
              const Text(
                'add to List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  posthead(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: rectangle(),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                rateAndaddToList(),
                TabBarPage(movieid: widget.movieid),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
