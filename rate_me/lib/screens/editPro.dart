import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: const [
            Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 40,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/pro2.png"),
            ),
            _TextEdit(),
          ],
        ),
      ),
    ));
  }
}

class _TextEdit extends StatefulWidget {
  const _TextEdit({Key? key}) : super(key: key);

  @override
  State<_TextEdit> createState() => _TextEditState();
}

class _TextEditState extends State<_TextEdit> {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final newPassController = TextEditingController();
  final rePassController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passController.dispose();
    newPassController.dispose();
    rePassController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: userController,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    decoration: const InputDecoration(
                        icon: Text('Username         '),
                        fillColor: Colors.white,
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Insert a new username',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    decoration: const InputDecoration(
                        icon: Text('Email                 '),
                        fillColor: Colors.white,
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Insert a new email',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }, //email มันไม่แก้ก็ได้ป้ะ
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: passController,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    decoration: const InputDecoration(
                        icon: Text('Password         '),
                        fillColor: Colors.white,
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Enter your current password',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: newPassController,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    decoration: const InputDecoration(
                        icon: Text('New Password'),
                        fillColor: Colors.white,
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Insert a new password',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: rePassController,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    decoration: const InputDecoration(
                        icon: Text('Re password    '),
                        fillColor: Colors.white,
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'new password again',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
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
            ),
          ),
        ],
      ),
    );
  }
}
