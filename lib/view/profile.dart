import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
