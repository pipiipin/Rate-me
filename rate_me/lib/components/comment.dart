import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CommentScreen extends StatefulWidget {
  final int movieid;
  CommentScreen({Key? key, required this.movieid}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentState();
}

class _CommentState extends State<CommentScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final textfieldController = TextEditingController();
  bool valSpoiled = false;
  bool spoil = true;
  double score = 4;
  var img = Image.asset("assets/pro2.png").image;
  var review = FirebaseFirestore.instance.collection('moviereview');
  var reviewform = <String, dynamic>{
    "like": 0,
    "movieid": 526896,
    "score": 4,
    "spoile": false,
    "text": "good one but too old in my generation",
    "userid": "0",
    "username": "Guess"
  };

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textfieldController.dispose();
    super.dispose();
  }

  addreview() async {
    if (valSpoiled) {
      spoil = true;
    } else {
      spoil = false;
    }
    ;
    reviewform['movieid'] = widget.movieid;
    reviewform['score'] = score;
    reviewform['spoile'] = spoil;
    reviewform['text'] = textfieldController.text.toString();
    reviewform['userid'] = user.uid;
    reviewform['username'] = user.displayName;
    reviewform['imagepath'] = user.photoURL;
    review.add(reviewform).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
// Add a new document with a generated ID

  @override
  Widget build(BuildContext context) {
    if (user.photoURL != null) {
      img = (Image.network(user.photoURL.toString())).image;
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(186, 1, 32, 105),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width / 1.15,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: img,
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 35,
                            unratedColor:
                                const Color.fromARGB(255, 218, 217, 217),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 90, 7, 255),
                            ),
                            onRatingUpdate: (rating) {
                              score = rating;
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                    _buildTextField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: valSpoiled,
                              onChanged: (value) {
                                setState(() {
                                  valSpoiled = true;
                                });
                              },
                            ),
                            const Text("Spoiled"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 235, 66, 66)),
                            ),
                            onPressed: () {
                              addreview();
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Post',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget _buildTextField() {
    const maxLines = 12;

    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      height: maxLines * 20.0,
      child: TextField(
        controller: textfieldController,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: "add your comment",
          fillColor: const Color.fromARGB(255, 218, 217, 217),
          filled: true,
        ),
      ),
    );
  }
}
