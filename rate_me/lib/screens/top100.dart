import 'package:flutter/material.dart';

class Top100Screen extends StatefulWidget {
  const Top100Screen({Key? key}) : super(key: key);

  @override
  _Top100Screen createState() => _Top100Screen();
}

class _Top100Screen extends State<Top100Screen> {
  final List<String> movies = [
    'Kingdom: Ashin of the North',
    'Batman',
    'Avengers: Endgame',
    'Adam project',
    'Uncharted',
    'Kingdom: Ashin of the North',
    'Batman',
    'Avengers: Endgame',
    'Adam project',
    'Uncharted',
  ];

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Top100List(movies),
            ],
          ),
        ),
      ),
    );
  }
}

class Top100List extends StatefulWidget {
  final List<String> nameMovie;

  const Top100List(this.nameMovie, {Key? key}) : super(key: key);
  @override
  _Top100ListState createState() => _Top100ListState();
}

class _Top100ListState extends State<Top100List> {
  _buildTop100List() {
    List<Widget> cards = [];

    for (var item in widget.nameMovie) {
      cards.add(
        Card(
          margin: const EdgeInsets.only(top: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: InkWell(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const YourListScreen()));
            // },
            child: SizedBox(
              width: 117,
              height: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage("assets/movie_example.jpg"),
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
                          width: 50,
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.fastfood),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "95%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: _buildTop100List(),
    );
  }
}