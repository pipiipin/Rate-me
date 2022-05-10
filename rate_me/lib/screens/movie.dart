// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:rate_me/components/tab_view.dart';

Widget posthead = Container(
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
    child: Image.asset(
      "assets/avenger.png",
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.dstATop,
    ),
  ),
);

Widget rectangle = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
        child: SizedBox(
      child: ClipRRect(
        child: Image.asset(
          "assets/minipos.png",
          fit: BoxFit.cover,
          width: 120.0,
          height: 175.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    )),
    Container(
      padding: const EdgeInsets.all(20),
      width: 250.0,
      height: 175.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromARGB(255, 233, 233, 233),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Avengers: Endgame",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Text(
              "Duration",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Text(
              "Year :",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rate :",
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

Widget rateAndaddToList = Container(
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
          const Text(
            '99%',
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
        children: const [
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
              "123,456",
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
        children: const [
          Icon(Icons.add, color: Colors.black,size: 35,),
          Text(
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

class MovieScreen extends StatefulWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<MovieScreen> createState() => _MovieScreen();
}

class _MovieScreen extends State<MovieScreen> {
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
                  posthead,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: rectangle,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                rateAndaddToList,
                const TabBarPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
