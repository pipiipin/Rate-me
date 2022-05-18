import 'dart:ffi';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rate_me/screens/editPro.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  final Image pathimg;

  const ProfilePic({Key? key, required this.pathimg}) : super(key: key);

  @override
  State<ProfilePic> createState() => _profileState();
}

class _profileState extends State<ProfilePic> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //"assets/pro2.png"
  var img = Image.asset("assets/pro2.png");
  @override
  void initState() {
    img = widget.pathimg;
    if (pickedFile != null) {
      img = Image.file(File(pickedFile!.path!));
    }
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

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Center(
      child: ProfileWidget(
        imagePath: img,
        onClicked: () async {},
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final Image imagePath;
  final VoidCallback onClicked;

  ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: imagePath.image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: () {
              _profileState().selectFile();
            },
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: Colors.black38,
          all: 8,
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class User {
  final String imagePath;
  // final String username;
  // final String email;
  //final int password;

  const User({
    required this.imagePath,
    // required this.username,
    // required this.email,
    // required this.password,
  });
}

class UserPreferences {
  static const myUser = User(
      imagePath:
          // "assets/pro2.png"
          "https://cdn-icons-png.flaticon.com/512/219/219983.png");
}
