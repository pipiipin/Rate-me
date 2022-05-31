// ignore_for_file: file_names, unused_local_variable

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_me/components/profile_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _TextEdit(),
            ],
          ),
        ));
  }

  void setState(Null Function() param0) {}
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _TextEdit extends StatefulWidget {
  const _TextEdit({Key? key}) : super(key: key);

  @override
  State<_TextEdit> createState() => _TextEditState();
}

class _TextEditState extends State<_TextEdit> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //"assets/pro2.png"
  var img = Image.asset("assets/pro2.png");

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      if (user != null) {
        img = Image.network(user.photoURL.toString());
      }
      pickedFile = result.files.first;
      if (pickedFile!.path != null) {
        img = Image.file(File(pickedFile!.path!));
      }
    });
  }

  Future update() async {
    if (pickedFile != null) {
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
    user.updateDisplayName(usernameController.text.trim());
    user.updateEmail(emailController.text.trim());
    // user.updateDisplayName(username);
    // user.updateEmail(email);
    print(usernameController.text.trim());
    print(emailController.text.trim());
    Navigator.of(context).pop(RefreshProgressIndicator.defaultStrokeWidth);
  }

  bool isUser = false;
  bool isEmail = false;
  bool isPass = false;

  final user = FirebaseAuth.instance.currentUser!;
  String username = "Guess";
  String email = "-";
  String pass = '';

  var usernameController = TextEditingController();
  var emailController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (pickedFile != null) {
      img = Image.file(File(pickedFile!.path!));
    } else {
      img = Image.network(user.photoURL.toString());
      usernameController =
          TextEditingController(text: user.displayName.toString());
      emailController = TextEditingController(text: user.email.toString());
      email = user.email.toString();
      username = user.displayName.toString();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text('Username',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 2,
                                child: !isUser
                                    ? Text(usernameController.text.trim())
                                    : TextFormField(
                                        controller: usernameController,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() => {
                                                isUser = false,
                                                username = value
                                              });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          fillColor: Color.fromARGB(
                                              255, 190, 189, 189),
                                          isDense: true,
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: 'Insert a new username',
                                          hintStyle: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black26),
                                        ),
                                      ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isUser = true,
                                      });
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text('Email',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 2,
                                child: !isEmail
                                    ? Text(emailController.text.trim())
                                    : TextFormField(
                                        controller: emailController,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() =>
                                              {isEmail = false, email = value});
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          fillColor: Color.fromARGB(
                                              255, 190, 189, 189),
                                          isDense: true,
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: 'Insert a new email',
                                          hintStyle: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black26),
                                        ),
                                      ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isEmail = true,
                                      });
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text('Password',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 2,
                                child: !isPass
                                    ? Text(pass)
                                    : TextFormField(
                                        initialValue: pass,
                                        obscureText: _isObscure,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() =>
                                              {isPass = false, pass = value});
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            },
                                            icon: Icon(_isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 14),
                                          fillColor: const Color.fromARGB(
                                              255, 190, 189, 189),
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: 'Insert a new password',
                                          hintStyle: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black26),
                                        ),
                                      ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isPass = true,
                                      });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () => update(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              primary: const Color.fromARGB(255, 1, 33, 105),
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
