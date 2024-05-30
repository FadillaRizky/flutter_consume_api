import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "History",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
