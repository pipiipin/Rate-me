import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentState();
}

class _CommentState extends State<CommentScreen> {
  bool valNoSpoiled = false;
  bool valSpoiled = false;

  @override
  Widget build(BuildContext context) {
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
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/pro2.png"),
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
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
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
                                  valNoSpoiled = false;
                                });
                              },
                            ),
                            const Text("Spoiled"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: valNoSpoiled,
                              onChanged: (value) {
                                setState(() {
                                  valNoSpoiled = true;
                                  valSpoiled = false;
                                });
                              },
                            ),
                            const Text('No Spolied'),
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
