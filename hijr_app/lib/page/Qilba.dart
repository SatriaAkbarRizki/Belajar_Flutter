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
      home: QilbaHome(),
    );
  }
}

class QilbaHome extends StatefulWidget {
  const QilbaHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeAppQilba();
  }
}

class HomeAppQilba extends State<QilbaHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                )),
          )
        ]),
      ),
    );
  }
}
