import 'package:flutter/material.dart';

import 'package:rate_me/screens/home.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);
  static const routeName = '/movie-screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
