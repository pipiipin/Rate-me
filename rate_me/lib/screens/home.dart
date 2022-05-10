import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:rate_me/components/trend_movies.dart';
import 'package:rate_me/components/new_movies.dart';
import 'package:rate_me/components/top10_movies.dart';
import 'package:rate_me/components/comingsoon.dart';
import 'package:rate_me/components/category.dart';

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Stranger Things",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
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
                                ],
                              ),
                            ]),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/popcorn.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                // Icon(
                                //   Icons.fastfood,
                                //   color: Color.fromARGB(255, 255, 255, 255),
                                //   size: 30,
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "98%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
