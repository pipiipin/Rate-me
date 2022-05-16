import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class OtherReview extends StatefulWidget {
  const OtherReview({Key? key}) : super(key: key);

  @override
  State<OtherReview> createState() => _OtherReviewState();
}

class _OtherReviewState extends State<OtherReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/pro2.png"),
              ),
              Text(
                'Aaron sosick',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const CommentProfile(),
        ],
      ),
    );
  }
}

class CommentProfile extends StatefulWidget {
  const CommentProfile({Key? key}) : super(key: key);

  @override
  State<CommentProfile> createState() => _CommentProfileState();
}

class _CommentProfileState extends State<CommentProfile> {
  final List<String> movies = [
    'Stranger things',
    'Stranger things',
    'Stranger things',
    'Stranger things',
    'Stranger things',
    'Stranger things',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _reviewList(),
    );
  }

  _reviewList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index,) {
              return Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 110,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Image(
                          image: new AssetImage("assets/poster.jpg"),
                          fit: BoxFit.cover),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "That's lit!!!",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Sarala',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert, color: Colors.black),
                        LikeButton(
                          size: 30,
                          circleColor: const CircleColor(
                              start: Colors.yellow, end: Colors.amber),
                          bubblesColor:  const BubblesColor(
                            dotPrimaryColor: Colors.yellow,
                            dotSecondaryColor: Colors.amber,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up,
                              color: isLiked
                                  ? Colors.amber
                                  : Colors.grey,
                              size: 30,
                            );
                          },
                          likeCount: 0,
                          
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
