import 'package:flutter/material.dart';
import 'package:rate_me/screens/history.dart';
import 'package:rate_me/screens/lastest.dart';
import 'package:rate_me/screens/login.dart';
import 'package:rate_me/screens/changecontent.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Emily Beer',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HistoryScreen()));
                          },
                          child: Column(children: const [
                            Image(
                              image: AssetImage("assets/piece.png"),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('history')
                          ]),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LastestScreen()));
                          },
                          child: Column(children: const [
                            Image(
                              image: AssetImage("assets/piece.png"),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('lastest')
                          ]),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const EditScreen()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(
                                  MediaQuery.of(context).size.width /
                                      4), // Image radius
                              child: Image.asset("assets/pro2.png",
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'edit profile',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChangeScreen()));
                          },
                          child: Column(children: const [
                            Image(
                              image: AssetImage("assets/piece.png"),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('content')
                          ]),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Column(children: const [
                            Image(
                              image: AssetImage("assets/piece.png"),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('log out')
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
