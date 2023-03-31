// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ClassState(),
        ),
      ),
    );
  }
}

class ClassState extends StatefulWidget {
  ClassState({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<ClassState> {
  List<String> nameMenuImage = <String>[
    'Abstract',
    'Animal',
    'Anime',
    'Black',
    'Fantasy',
    'Holiday',
    'Minimalis'
  ];

  List<String> listPictures = <String>[
    'https://images.unsplash.com/photo-1675796636176-87f6d46753eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1675897974745-1e78e8690755?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=374&q=80',
    'https://images.unsplash.com/photo-1574691545845-7c05715a725d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=455&q=80',
    'https://images.unsplash.com/photo-1675795290346-b20b2e22d6c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1640200327310-318c50bc5819?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',
    'https://images.unsplash.com/photo-1676018526208-0c80014f8a50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('ImageStore',
                          style: TextStyle(
                              fontFamily: 'Alkatra',
                              fontSize: 24,
                              foreground: Paint()
                                ..shader = LinearGradient(colors: <Color>[
                                  Color.fromARGB(255, 159, 26, 199),
                                  Colors.blue
                                ]).createShader(
                                    Rect.fromLTWH(0, 0, 100.0, 300.0))))
                    ],
                  ),
                ),
                menuImage(),
                SizedBox(
                  height: 1200,
                  child: listImage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget menuImage() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nameMenuImage.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: GestureDetector(
            onTap: () {},
            child: Container(
                child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(nameMenuImage[index]),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ));
        },
      ),
    );
  }

  Widget menuImage2() {
    return ListView.builder(
      itemCount: nameMenuImage.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: GestureDetector(
          onTap: () {},
          child: Container(
              child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(nameMenuImage[index]),
            ),
          )),
        ));
      },
    );
  }

  Widget listImage() {
    return ListView.builder(
        itemCount: listPictures.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: GestureDetector(
              child: Container(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SizedBox(
                          height: 120,
                          child: Image.network(listPictures[index])),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
