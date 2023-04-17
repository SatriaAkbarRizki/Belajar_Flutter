// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrayerHome(),
    );
  }
}

class PrayerHome extends StatefulWidget {
  const PrayerHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeApp();
  }
}

class HomeApp extends State<PrayerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 30, right: 27),
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/Icons/Close.svg',
              color: Color(0xFFA6A6A6),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 21, top: 7),
          child: Text(
            'Prayer time',
            style: TextStyle(
                color: Color(0xFF141414),
                fontFamily: 'Work Sans',
                fontSize: 36,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 23, top: 7),
          child: Text(
            'How it’s going so far',
            style: TextStyle(
                color: Color(0xFF141414),
                fontFamily: 'Work Sans',
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    );
  }
}
