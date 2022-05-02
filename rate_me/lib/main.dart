import 'package:flutter/material.dart';
import 'package:rate_me/screens/login.dart';
import 'package:rate_me/screens/welcome.dart';
import 'package:rate_me/screens/signup.dart';
import 'package:rate_me/screens/chip.dart';


void main() {
  runApp(const MyApp());
}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Colors.white,
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color.fromARGB(255, 1, 33, 105),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Colors.black,
  onBackground: Colors.white,
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
        fontFamily: 'Sarala',   
      ),
      home: const WelcomeScreen(),
      routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
        },
    );
  }
}
