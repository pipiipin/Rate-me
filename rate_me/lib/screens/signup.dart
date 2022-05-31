import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tmdb_api/tmdb_api.dart';
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
  var idlist = Random().nextInt(3000);
  final String apiKey = "77007faac05ec9c7ac4e6c1bd5e8c917";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwN2ZhYWMwNWVjOWM3YWM0ZTZjMWJkNWU4YzkxNyIsInN1YiI6IjYyNzI1YzVjN2NmZmRhNzMxNzljMzE5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Oo6sYnYEa0VOEciMuAL78Gt64Wc_qq1qGUlY8OB-7s";

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //"assets/pro2.png"
  var img = Image.asset("assets/pro2.png");

  // loadtrendingmovie(var name) async {
  //   TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
  //       logConfig: ConfigLogger(
  //         showLogs: true,
  //         showErrorLogs: true,
  //       ));
  //   Map rt = await tmdbWithCustomLogs.v4.auth.createRequestToken();
  //   String rtoken = rt['request_token'];
  //   Map at = await tmdbWithCustomLogs.v4.auth.createAccessToken(rtoken);
  //   String atoken = at["access_token"];
  //   Map newresult = await tmdbWithCustomLogs.v4.lists.createList(atoken, name);
  //   print(name);
  //   print('newresult');
  //   print(newresult["list_id"]);

  //   setState(() {
  //     idlist = newresult["list_id"];
  //   });

  //   return newresult["list_id"];
  // }

  var histlist = [550];
  var listmovie = [550];

  createlist() async {
    var list = FirebaseFirestore.instance.collection('Listmovie');
    var listform = <String, dynamic>{
      "listid": idlist,
      "usernamelist": usernameController.text.trim(),
      "movieid": listmovie
    };

    // listform['usernamelist'] = usernameController.text.trim();
    // print('idlist' + idlist.toString());
    // listform['listid'] = idlist;
    // listform['movieid'] = listmovie;

    list.add(listform).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  createhist() async {
    var hist = FirebaseFirestore.instance.collection('History');
    var histform = <String, dynamic>{
      "usernamehist": usernameController.text.trim(),
      "historylist": histlist
    };
    // histform['usernamehist'] = usernameController.text.trim();
    print('hist:' + histform['historylist']);

    // histform['historylist'] = histlist;

    hist.add(histform).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

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
      print('do createlist');
      //print(loadtrendingmovie(usernameController.text.trim()).toString());
      print('createlist finish');
      createlist();
      createhist();
      uploadfile();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
