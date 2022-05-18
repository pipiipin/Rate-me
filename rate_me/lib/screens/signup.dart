import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_me/screens/login.dart';
import 'package:rate_me/screens/content.dart';
import 'package:file_picker/file_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const routeName = '/signup-screen';

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //"assets/pro2.png"
  var img = Image.asset("assets/pro2.png");

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
      if (pickedFile!.path != null) {
        img = Image.file(File(pickedFile!.path!));
      }
    });
  }

  Future uploadfile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urldownload = await snapshot.ref.getDownloadURL();
    print(urldownload);
    final user = FirebaseAuth.instance.currentUser!;
    user.updatePhotoURL(urldownload);
  }

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            const Text(
              "REGISTER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 33, 105),
                  fontSize: 36),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                selectFile();
              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage: img.image,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "username",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 33, 105), fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16),
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      fillColor: const Color.fromARGB(255, 196, 196, 196),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "email",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 33, 105), fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      fillColor: const Color.fromARGB(255, 196, 196, 196),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "password",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 33, 105), fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Please enter min 6 character';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      fillColor: const Color.fromARGB(255, 196, 196, 196),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "re-enter password",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 33, 105), fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16),
                    controller: passwordconController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      }
                      if (passwordController.text !=
                          passwordconController.text) {
                        return 'your confirm password is not match';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      fillColor: const Color.fromARGB(255, 196, 196, 196),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  print(passwordController.text);
                  print(passwordconController.text);
                  if (_formKey.currentState!.validate()) {
                    signUp();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContentChoice()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                  primary: const Color.fromARGB(255, 1, 33, 105),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))
                },
                child: const Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 33, 105)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = FirebaseAuth.instance.currentUser!;
      user.updateDisplayName(usernameController.text.trim());

      uploadfile();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
