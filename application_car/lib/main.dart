import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final List<String> listImage = [
    "assets/images/steven.jpg",
    "assets/images/steven2.jpg",
    "assets/images/josh.jpg"
  ];

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var imgCount = listImage.length;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ListView(scrollDirection: Axis.vertical, children: [
              for (var item in listImage)
                Center(
                  child: Container(
                      margin: EdgeInsets.all(12), child: Image.asset(item)),
                )
            ]),
            Container(
              child: Center(
                child: Text("asas"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
