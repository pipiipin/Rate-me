import 'package:flutter/material.dart';
import 'package:rate_me/components/tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      //TabBarPage()
      //mentWidget(),
    );
  }
}

Widget posthead = Container(
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
      width: 510.0,
      height: 295.0,
      colorBlendMode: BlendMode.dstATop,
    ),
  ),
);

Widget rectangle = Row(
  children: [
    Container(
        padding: const EdgeInsets.only(
          left: 40,
        ),
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
      width: 300.0,
      height: 140.0,
      padding: const EdgeInsets.only(
        left: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 246, 246, 246),
          child: Column(children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    "Name of movie",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    "Duration",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
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
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    "Year",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
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
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    "Rate",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Sarala',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                      child: const Text(
                        "horror",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(127, 204, 20, 43),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                      child: const Text(
                        "drama",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(127, 204, 20, 43),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ]),
        ),
      ),
    ),
  ],
);

Widget rateAndaddToList = Row(
  children: [
    Container(
      padding: const EdgeInsets.only(left: 40, top: 10, right: 5),
      child: SizedBox(
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
    Container(
      padding: const EdgeInsets.only(left: 60, top: 10, right: 5),
      alignment: Alignment.centerLeft,
      child: Column(children: [
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Number of visitors",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
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
                  fontSize: 12.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ]),
    ),
    Container(
      padding: const EdgeInsets.only(left: 70, top: 10, right: 5),
      child: Row(
        children: [
          Column(
            children: const [
              Icon(Icons.add, color: Colors.black),
              Text(
                'add to List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8.0,
                  fontFamily: 'Sarala',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width = 0.0;
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 380,
              child: Stack(
                children: <Widget>[
                  posthead,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      rectangle,
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [rateAndaddToList, const TabBarPage()],
            ),
          ],
        ),
      ),
    );
  }
}
