import 'package:flutter/material.dart';
import 'package:rate_me/components/top100_list.dart';

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


