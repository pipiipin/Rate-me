import 'package:flutter/material.dart';
import 'package:rate_me/components/yourlist_card.dart';

class YourListScreen extends StatelessWidget {
  const YourListScreen({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 1, 33, 105),
        title: const Text(
          'Your list',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Column(
              children: const [
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
