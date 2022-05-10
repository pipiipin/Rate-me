import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rate_me/screens/default.dart';
import 'package:rate_me/components/category.dart';

// import 'package:rate_me/components/bottombar.dart';
import 'package:rate_me/screens/login.dart';
import 'package:rate_me/screens/movie.dart';
import 'package:rate_me/screens/signup.dart';
import 'package:rate_me/screens/content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rate me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieScreen(),
      routes: {
        SignupScreen.routeName: (context) => const SignupScreen(),
        SigninScreen.routeName: (context) => const SigninScreen(),
        ContentChoice.routeName: (context) => const ContentChoice(),
      },
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _openingController;
  bool logoAnimated = false;

  @override
  void initState() {
    super.initState();
    _openingController = AnimationController(vsync: this);
    _openingController.addListener(() {
      if (_openingController.value == 1) {
        _openingController.stop();
        logoAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _openingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 33, 105),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: logoAnimated ? screenHeight / 1.45 : screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !logoAnimated,
                  child: Lottie.asset(
                    'assets/popcorn.json',
                    controller: _openingController,
                    onLoaded: (composition) {
                      _openingController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: logoAnimated,
                  child: Image.asset(
                    'assets/logo.png',
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
              ],
            ),
          ),
          Visibility(visible: logoAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SigninScreen())),
              child: const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 33, 105),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 45),
                  primary: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignupScreen())),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 33, 105),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 45),
                  primary: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
            const SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}
