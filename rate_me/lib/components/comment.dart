import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class comment extends StatefulWidget {
  const comment({Key? key}) : super(key: key);

  @override
  State<comment> createState() => _commentState();
}

class _commentState extends State<comment> {
  bool valNoSpoiled = false;
  bool valSpoiled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(186, 1, 32, 105),
      body: Center(
        child: SizedBox(
            width: 350,
            height: 580,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.cancel),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        child: Icon(Icons.account_circle, size: 60),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )),
                    ],
                  ),
                  _buildTextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Text("Spoiled"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Text('No Spolied'),
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
                          onPressed: () {},
                          child: const Text(
                            'Post',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildTextField() {
    const maxLines = 15;

    return Container(
      margin: const EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: const TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "add your comment",
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
        ),
      ),
    );
  }
}
