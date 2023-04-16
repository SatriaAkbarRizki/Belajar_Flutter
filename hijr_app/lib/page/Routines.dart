import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijr_app/main.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoutinesHome(),
    );
  }
}

class RoutinesHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateRoutines();
  }
}

class StateRoutines extends State<RoutinesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 21, top: 53),
            child: const Text(
              'Routines',
              style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 36,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 21, top: 5),
            child: const Text(
              'How it’s going so far',
              style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 14,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 52, right: 52, top: 117),
              child: SvgPicture.asset(
                'assets/Icons/PeopleFix.svg',
                width: 254.87,
                height: 248.32,
              )),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 28),
            child: const Text(
              'Coming soon',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 51, top: 8),
            child: const Text(
              'Stay tuned for updates, and get ready for an app experience like no other!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 14,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
