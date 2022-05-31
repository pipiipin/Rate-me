import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/components/profile_pic.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'movie.dart';

class YourListScreen extends StatefulWidget {
  const YourListScreen({Key? key}) : super(key: key);

  @override
  _YourListScreen createState() => _YourListScreen();
}

class _YourListScreen extends State<YourListScreen> {
  var list = FirebaseFirestore.instance.collection('Listmovie');
  final user = FirebaseAuth.instance.currentUser!;
  var listid = [];
  setdata() async {
    await list.get().then((event) {
      setState(() {
        List reviewssetspoile = [];
        List reviewssetnospoile = [];
        for (var doc in event.docs) {
          if (user.displayName == doc.data()['usernamelist']) {
            print("i see");
            listid = doc.data()['movieid'];
            print(listid[0]);
          }
        }
      });
      print(listid.length);
      for (int i = 0; i < listid.length; i++) {
        findmovie(i);
      }
    });
  }

  renovefromlist(int movieid) async {
    var lists = [movieid];
    var doc_id;
    await list.get().then((event) {
      setState(() {
        for (var doc in event.docs) {
          if (user.displayName == doc.data()['usernamelist']) {
            var listmov = [];
            listmov = doc.data()['movieid'];
            doc_id = doc.id;
          }
        }
      });
    });
    list.doc(doc_id).update({"movieid": FieldValue.arrayRemove(lists)});
  }

  var topmovie = [];
  final String apiKey = "77007faac05ec9c7ac4e6c1bd5e8c917";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwN2ZhYWMwNWVjOWM3YWM0ZTZjMWJkNWU4YzkxNyIsInN1YiI6IjYyNzI1YzVjN2NmZmRhNzMxNzljMzE5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Oo6sYnYEa0VOEciMuAL78Gt64Wc_qq1qGUlY8OB-7s";

  @override
  void initState() {
    setdata();

    super.initState();
  }

  findmovie(int index) async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map topresult =
        await tmdbWithCustomLogs.v3.movies.getDetails(listid[index]);
    print(topresult);

    setState(() {
      topmovie.add(topresult);
    });
  }

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
        itemCount: topmovie.length,
        itemBuilder: (context, index) {
          // print(topmovie[index]['genre_ids']);
          // print(topmovie[index]["runtime"]);
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                    movieid: topmovie[index]['id'])));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200' +
                            topmovie[index]['poster_path'],
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                topmovie[index]['title'],
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
                                const Icon(Icons.language),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  topmovie[index]['original_language']
                                      .toString(),
                                  style: const TextStyle(fontSize: 16),
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
                                  "Release date :",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (topmovie[index]["release_date"]).toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
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
                        padding: const EdgeInsets.only(right: 10),
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
                                  Text(
                                    topmovie[index]['vote_average'].toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                onPressed: () {
                                  setState(() {
                                    renovefromlist(topmovie[index]['id']);
                                    topmovie.removeAt(index);
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
