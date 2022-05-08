import 'package:flutter/material.dart';

class newMovies extends StatefulWidget {
  const newMovies({Key? key}) : super(key: key);

  @override
  State<newMovies> createState() => _newMoviesState();
}

class _newMoviesState extends State<newMovies> {
  final List<String> movies = [
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/movie_example.jpg",
    "assets/poster.jpg",
    "assets/movie_example.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New movies",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 168,
            color: Colors.white,
            child: (_buildYourList()),
          ),
        ],
      ),
    );
  }

  _buildYourList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.black,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(movies[index]),
                  width: 100,
                  height: 158,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
