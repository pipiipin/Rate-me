import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

class PopupReview extends StatefulWidget {
  final String name;
  final String text;
  final Image profilepath;
  final int like;
  final double score;

  const PopupReview(
      {Key? key,
      required this.name,
      required this.text,
      required this.profilepath,
      required this.score,
      required this.like})
      : super(key: key);

  @override
  State<PopupReview> createState() => _PopupReviewState();
}

class _PopupReviewState extends State<PopupReview> {
  bool valNoSpoiled = false;
  bool valSpoiled = false;
  String text =
      'After half of all life is snapped away by Thanos, the Avengers are left scattered and divided. Now with a way to reverse the damage, the Avengers and their allies assemble once more and learn to put differences aside in order to work together and set things right. Along the way, the Avengers realize that sacrifices must be made as they prepare for the ultimate final showdown with Thanos, which will result in the heroes fighting the biggest battle they have ever faced.';

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
            height: MediaQuery.of(context).size.width / 1.15,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: (widget.profilepath).image,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Sarala',
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      LikeButton(
                        size: 30,
                        circleColor: const CircleColor(
                            start: Colors.grey, end: Colors.black),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.grey,
                          dotSecondaryColor: Colors.black,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.thumb_up,
                            color: isLiked ? Colors.black : Colors.grey,
                            size: 30,
                          );
                        },
                        likeCount: 655,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.score,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 35,
                        unratedColor: const Color.fromARGB(255, 218, 217, 217),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.score.toString())
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(widget.text),
                ),
              ],
            )),
      ),
    );
  }
}
