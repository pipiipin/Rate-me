import 'package:flutter/material.dart';
import 'package:rate_me/screens/login.dart';
import 'package:rate_me/screens/content.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const routeName = '/signup-screen';

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 33, 105),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "username",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 33, 105),
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "email",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 33, 105),
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 33, 105),
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        maxLines: 1,
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "re-enter password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 33, 105),
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your password';
                          }
                          return null;
                        },
                        maxLines: 1,
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 196, 196, 196),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ContentChoice()));
                            }
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.fromLTRB(60, 10, 60, 10),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 1, 33, 105)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            "Already Have an Account?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 33, 105),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninScreen(),
                                ),
                              );
                            },
                            child: const Text('Sign in'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
