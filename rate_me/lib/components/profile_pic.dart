import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _profileState();
}

class _profileState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Center(
      child: ProfileWidget(
        imagePath: user.imagePath,
        onClicked: () async {},
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
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
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
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
        "https://cdn-icons-png.flaticon.com/512/219/219983.png"
  );
}