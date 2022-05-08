import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rate_me/screens/default.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _successController;
  late AnimationController _checkController;
  //late Animation<double> animation;
  bool logoredCheck = false;

  @override
  void initState() {
    super.initState();
    _successController = AnimationController(
      //duration: const Duration(seconds: 5),
      vsync: this,
    );
    //animation = Tween<double>(begin:0, end: 900).animate(_successController);

    _checkController = AnimationController(
      //duration: const Duration(minutes: 3),
      vsync: this,
    );
    _successController.addListener(() {
      if (_successController.isCompleted) {
        _successController.stop();
        logoredCheck = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _successController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: logoredCheck ? screenHeight / 1.45 : screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !logoredCheck,
                  child: Lottie.asset(
                    'assets/cinema-clap.json',
                    controller: _successController,
                    onLoaded: (composition) {
                      _successController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: logoredCheck,
                  child: Lottie.asset(
                    'assets/redsuccess.json',
                    height: 300.0,
                    width: 300.0,
                    controller: _checkController,
                    onLoaded: (composition) {
                      _checkController
                        ..duration = composition.duration
                        ..forward().whenComplete(() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DefaultScreen()),
                            ));
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(visible: logoredCheck, child: const _BottomPart()),
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
          children: const [
            //const SizedBox(height: 30.0),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home Page")));
  }
}
