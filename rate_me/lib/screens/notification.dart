// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);
  @override
  _NotifyScreen createState() => _NotifyScreen();
}

class Notification {
  final String typeNotify;
  final String detail;

  Notification(this.typeNotify, this.detail);
}

class _NotifyScreen extends State<NotifyScreen> {
  final List<Notification> notifications = [
    Notification('like', 'Aaron sosick liked your comment in "Friends 1"'),
    Notification('comment', 'you just comment in "Friends 1"')
  ];

  String _image = "";

  String _setImage(String _typeNotify) {
    if (_typeNotify == "like") {
      _image = "assets/like.png";
    } else if (_typeNotify == "comment") {
      _image = "assets/pencil.png";
    }

    print("Title: $_typeNotify"); // works
    print("Image: $_image");
    return _image;
    // works
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 1, 33, 105),
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: _buildNotiList(),
      ),
    );
  }

  _buildNotiList() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(top: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromARGB(255, 214, 214, 214),
          child: SizedBox(
            height: 120,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(
                          _setImage(notifications[index].typeNotify)),
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            notifications[index].detail,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
