import 'package:flutter/material.dart';
import 'package:rate_me/screens/categorieresultpage.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  _CategoryScreen createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(186, 1, 32, 105),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Comedy"),
                    ),
                  );
                },
                child: const Text('comedy'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Horror"),
                    ),
                  );
                },
                child: const Text('horror'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Romance"),
                    ),
                  );
                },
                child: const Text('romance'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Crime"),
                    ),
                  );
                },
                child: const Text('Crime'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Drama"),
                    ),
                  );
                },
                child: const Text('drama'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Fantasy"),
                    ),
                  );
                },
                child: const Text('fantasy'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Action"),
                    ),
                  );
                },
                child: const Text('action'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Science Fiction"),
                    ),
                  );
                },
                child: const Text('sci-fi'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Adventure"),
                    ),
                  );
                },
                child: const Text('adventure'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 5.0,
                color: const Color.fromARGB(255, 196, 196, 196),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
                child: const Text('2022'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
                child: const Text('2021'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
                child: const Text('2020'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
                child: const Text('2019'),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close, size: 40),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
