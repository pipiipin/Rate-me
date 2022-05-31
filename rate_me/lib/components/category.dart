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
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Comedy"),
                    ),
                  );
                },
                child: const Text(
                  'comedy',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Horror"),
                    ),
                  );
                },
                child: const Text(
                  'horror',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Romance"),
                    ),
                  );
                },
                child: const Text(
                  'romance',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Crime"),
                    ),
                  );
                },
                child: const Text(
                  'Crime',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Drama"),
                    ),
                  );
                },
                child: const Text(
                  'drama',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Fantasy"),
                    ),
                  );
                },
                child: const Text(
                  'fantasy',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultScreen(genre: "Action"),
                    ),
                  );
                },
                child: const Text(
                  'action',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Science Fiction"),
                    ),
                  );
                },
                child: const Text(
                  'sci-fi',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreen(genre: "Adventure"),
                    ),
                  );
                },
                child: const Text(
                  'adventure',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                height: 5.0,
                color: const Color.fromARGB(255, 196, 196, 196),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: const Text(
              //     '2022',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: const Text(
              //     '2021',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: const Text(
              //     '2020',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: const Text(
              //     '2019',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
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
