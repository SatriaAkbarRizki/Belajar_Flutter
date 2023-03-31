import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // final List<String> collectionImage = [
  //   "assets/images/",
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nusantara'),
        ),
        body: Column(children: <Widget>[
          Image.network(
            "https://images.unsplash.com/photo-1679233753436-e562ea622fe0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4NXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
            width: 400,
            height: 250,
          ),
          Image.asset(
            "assets/images/steven.jpg",
            width: 400,
            height: 250,
          ),
          const Text(
            "City Street",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Open Sans",
              color: Colors.blue,
            ),
            textAlign: TextAlign.right,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1667394021292-9ae09e1786f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                    child: Image.network(
                  "https://images.unsplash.com/photo-1667393942211-6ba805120179?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                  fit: BoxFit.cover,
                )),
                Flexible(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1567954056399-84157f6e86b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
