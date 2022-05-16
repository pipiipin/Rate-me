// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:rate_me/components/profile_pic.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
              ProfilePic(),
              _TextEdit(),
            ],
          ),
        ));
  }
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
  bool isUser = false;
  bool isEmail = false;
  bool isPass = false;

  String user = 'Emily Beer';
  String email = '123@gmail.com';
  String pass = '123456';

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                                    ? Text(user)
                                    : TextFormField(
                                        initialValue: user,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() =>
                                              {isUser = false, user = value});
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
                                    ? Text(email)
                                    : TextFormField(
                                        initialValue: email,
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
                                           suffixIconConstraints: BoxConstraints(maxHeight: 14),
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
            onPressed: () => Navigator.of(context).pop(),
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
