import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeStatefullHome(),
    );
  }
}

class MyHomeStatefullHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeStatefull();
  }
}

class MyHomeStatefull extends State<MyHomeStatefullHome> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOption = <Widget>[
    Text(
      'Index 0 : Home',
      style: optionStyle,
    ),
    Text(
      'Index 1 : Menu',
      style: optionStyle,
    ),
    Text(
      'Index 2 : About',
      style: optionStyle,
    ),
  ];

  void onItemClick(int index) => setState(() {
        selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Navigation Baseic"),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/eror404.png'),
          _widgetOption.elementAt(selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'About',
              backgroundColor: Colors.green)
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: onItemClick,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Image.asset('assets/images/eror404.png')),
            // UserAccountsDrawerHeader(
            //     currentAccountPicture: Image.asset('assets/images/eror404.png'),
            //     accountName: Text('Satria'),
            //     accountEmail: Text('accountEmail')
            //     ),
            const ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
            const ListTile(
              title: Text('Menu'),
              leading: Icon(Icons.menu),
            ),
            const ListTile(
              title: Text('About'),
              leading: Icon(Icons.account_box),
            )
          ],
        ),
      ),
    );
  }
}
