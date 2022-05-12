import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:rate_me/components/trend_movies.dart';
import 'package:rate_me/components/new_movies.dart';
import 'package:rate_me/components/top10_movies.dart';
import 'package:rate_me/components/comingsoon.dart';
import 'package:rate_me/components/category.dart';
import '../components/movie.dart';
import '../service/movie_service.dart';
import '../service/movies_exception.dart';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  static const routeName = '/content-screen';

  @override
  State<HomeWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  @override
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/poster.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Stranger things",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 2, 15, 2),
                                    child: const Text(
                                      "horror",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          104, 103, 103, 103),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 2, 15, 2),
                                    child: const Text(
                                      "comedy",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          104, 103, 103, 103),
                                    ),
                                  ),
                                ]),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.fastfood,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "98%",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
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
