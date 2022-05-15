import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 50,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/pro2.png"),
                  ),
                  SizedBox(
                    width: 70,
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
              CommentProfile(),
            ],
          ),
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
      child: _commentList(),
    );
  }

  _commentList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage("assets/avenger.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
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
                        Row(
                          children: const [
                            Text(
                              '50.4 K',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Sarala',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            Icon(
                              Icons.thumb_up,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
