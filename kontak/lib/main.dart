import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Data.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'page/History.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 268, 200, 230),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeState();
  }
}

class HomeState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeState> {
  int angka = 0;
  int indexNav = 0;

  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    _pageController;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void indexPage(int index) {
    setState(() {
      indexNav = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              listContact(),
            ],
          ),
          History()
        ],
        onPageChanged: (value) => setState(() {
          indexPage(value);
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'History', icon: Icon(Icons.history)),
          BottomNavigationBarItem(label: 'People', icon: Icon(Icons.people))
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        onTap: (value) {
          _pageController.jumpToPage(value);
          indexPage(value);
        },
      ),
    );
  }

  Widget listContact() {
    late List<String> listName = [];
    late List<String> listProfile = [];
    late List<int> listNumber = [];

    for (Contact contact in Contact.dataContact) {
      listName.add(contact.name);
      listProfile.add(contact.Profile);
      listNumber.add(contact.Number);
    }
    var random = Random();
    // var randomColor = Random().nextInt()
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Contact.dataContact.length,
        itemBuilder: (context, index) {
          return Container(
            child: GestureDetector(
              onTap: () {
                popContact(context, listName[index], listProfile[index]);
              },
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('${listProfile[index]}'),
                      ),
                      title: Text('${listName[index]}'),
                      subtitle: Text('${listNumber[index]}'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  popContact(BuildContext context, String name, String urlImage) => Alert(
        context: context,
        content: Column(
          children: [
            Container(
              height: 400,
              width: 600,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                urlImage,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(name)
          ],
        ),
        buttons: [
          DialogButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ).show();
}
