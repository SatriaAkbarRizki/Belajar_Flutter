import 'package:flutter/material.dart';

import 'main.dart';

void main(List<String> args) {
  runApp(navigator2());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const navigator2();
  }
}

class navigator2 extends StatelessWidget {
  const navigator2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateHome();
  }
}

class StateHome extends State<MyHome> {
  int selectIndex = 0;
  void onItemClick(int index) => setState(() {
        selectIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        body: ListView(
          children: [CardDate()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'About',
                backgroundColor: Colors.green)
          ],
          currentIndex: selectIndex,
          onTap: (onItemClick) {
            setState(() {
              selectIndex = onItemClick;
              if (selectIndex == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeApp()));
              } else if (selectIndex == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const navigator2()));
              }
            });
          },
        ),
      ),
    );
  }
}

class CardDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.surfaceVariant)),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Filled dard')),
        ),
      ),
    );
  }
}
