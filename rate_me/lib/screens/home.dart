import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:rate_me/components/trend_movies.dart';
import 'package:rate_me/components/new_movies.dart';
import 'package:rate_me/components/top10_movies.dart';
import 'package:rate_me/components/comingsoon.dart';
import 'package:rate_me/components/category.dart';
import 'package:rate_me/screens/searchresult.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var numran = Random().nextInt(19);
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

    Map topresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    setState(() {
      topmovie = topresult['results'];
    });
  }

  bool _searchBoolean = false;
  @override
  Widget _buildSearchField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(searchword: value),
              ),
            ),
            autofocus: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              isCollapsed: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              border: InputBorder.none,
              hintText:
                  'Search', //Text that is displayed when nothing is entered.
              hintStyle: TextStyle(
                //Style of hintText
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(123, 0, 0, 0),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            _displayDialog(context);
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          !_searchBoolean ? const SizedBox() : _buildSearchField(),
          !_searchBoolean
              ? IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = true;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = false;
                    });
                  })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topmovie[numran]['poster_path'])
                              .image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                // child: Text(
                                //   topmovie[numran]['title'],
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 24,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                            Row(
                              children: [
                                // Container(
                                //   width: 50,
                                //   height: 50,
                                //   decoration: const BoxDecoration(
                                //     image: DecorationImage(
                                //         image: AssetImage("assets/popcorn.png"),
                                //         fit: BoxFit.cover),
                                //   ),
                                // ),
                                // Icon(
                                //   Icons.fastfood,
                                //   color: Color.fromARGB(255, 255, 255, 255),
                                //   size: 30,
                                // ),
                                // const SizedBox(
                                //   width: 10,
                                // ),
                                // Text(
                                //   topmovie[numran]['vote_average'].toString(),
                                //   style: TextStyle(
                                //       color: Colors.white, fontSize: 20),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const trendMovies(),
            const newMovies(),
            const top10(),
            const comingsoon(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const CategoryScreen();
      },
      animationType: DialogTransitionType.slideFromLeft,
    );
  }
}
