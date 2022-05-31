import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/screens/editPro.dart';
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
  var img = Image.asset("assets/pro2.png");
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (user != null) {
        img = Image.network(user.photoURL.toString());
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((user.displayName).toString(),
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
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 const HistoryScreen()));
                        //   },
                        //   child: Column(children: const [
                        //     Image(
                        //       image: AssetImage("assets/piece.png"),
                        //       fit: BoxFit.cover,
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text('history')
                        //   ]),
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LastestScreen()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditScreen()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: img.image,
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
                                    builder: (context) =>
                                        const ChangeScreen()));
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
                            FirebaseAuth.instance.signOut();
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
