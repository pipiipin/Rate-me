import 'package:flutter/material.dart';

class YourListScreen extends StatefulWidget {
  const YourListScreen({Key? key}) : super(key: key);

  @override
  _YourListScreen createState() => _YourListScreen();
}

class _YourListScreen extends State<YourListScreen> {
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
          'Your list',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: _buildYourList(),
      ),
    );
  }

  _buildYourList() {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(top: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: SizedBox(
              height: 150,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage("assets/movie_example.jpg"),
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                movies[index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "1hr 30min",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "horror",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "R+",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "2019",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(Icons.fastfood),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "55%",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.library_add_check,
                                  color: Colors.yellow,
                                  size: 40,
                                ),
                                onPressed: () {
                                  setState(() {
                                    movies.removeAt(index);
                                  });
                                },
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}


