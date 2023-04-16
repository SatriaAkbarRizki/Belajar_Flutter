// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:hijr_app/page/Prayers.dart';
import 'package:hijr_app/page/Qilba.dart';
import 'package:hijr_app/page/Discover.dart';
import 'package:hijr_app/page/Routines.dart';
import 'package:hijr_app/page/Profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeApp();
  }
}

class _HomeApp extends State<HomeApp> {
  late PageController _pageController = PageController();

  bool isPressed_ColorText = false;
  int indexDateItem = -1;
  int indexMenuItem = -1;
  int indexNavBarNow = 0;

  var iconMenu = {
    'Qibla': 'assets/Icons/Qibla.svg',
    'Prayer': 'assets/Icons/Prayer.svg',
    'Soon': 'assets/Icons/Nothing.svg',
    'Soon2': 'assets/Icons/Nothing.svg',
  };

  var alarmUser = {
    '05:24': 'Fajr in 38 minutes',
    '07:00': 'Get Ready for work'
  };

  List<String> nameDay = <String>[
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  void changeIndexNav(int index) {
    setState(() {
      indexNavBarNow = index;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          ListView(
            children: [
              locationMe(),
              textWelcome(),
              dateScrollable(),
              listAlarmUser(),
              textExplore(),
              menuExplore(),
              textLatestArticles(),
              Articles()
            ],
          ),
          RoutinesHome(),
          DiscoverHome(),
          ProfileHome(),
        ],
        onPageChanged: (index) {
          setState(() {
            changeIndexNav(index);
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/Home.svg'),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              'assets/Icons/Home.svg',
              color: Color(0xFF2AB364),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/Routines.svg'),
            label: 'Routines',
            activeIcon: SvgPicture.asset(
              'assets/Icons/Routines.svg',
              color: Color(0xFF2AB364),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/Discover.svg'),
            label: 'Discover',
            activeIcon: SvgPicture.asset(
              'assets/Icons/Discover.svg',
              color: Color(0xFF2AB364),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/Profile.svg'),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              'assets/Icons/Profile.svg',
              color: Color(0xFF2AB364),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFF2AB364),
        unselectedItemColor: Color(0xFF141414),
        backgroundColor: Color(0xFFFAFAFA),
        selectedFontSize: 12,
        currentIndex: indexNavBarNow,
        onTap: (index) {
          _pageController.jumpToPage(index);
          changeIndexNav(index);
        },
      ),
    );
  }

  Widget locationMe() {
    return Container(
      margin: EdgeInsets.only(left: 21, top: 58),
      child: Row(
        children: [
          SvgPicture.asset('assets/Icons/map.svg', width: 18, height: 20.49),
          SizedBox(width: 8),
          const Text(
            'Kecamatan Langsa Lama, Aceh',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget textWelcome() {
    return Container(
      width: 310,
      height: 84,
      margin: EdgeInsets.only(top: 55, left: 21, right: 29),
      child: Wrap(
        children: [
          RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF141414),
                      fontFamily: 'Work Sans'),
                  children: [
                TextSpan(
                  text: "Assalamu'alaikum,",
                ),
                TextSpan(
                    text: ' Haikal',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ])),
          Container(
            margin: EdgeInsets.only(top: 26),
            child: const Text(
              'How it’s going so far',
              style: TextStyle(fontFamily: 'Work Sans', fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget dateScrollable() {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 20, top: 52, bottom: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nameDay.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: indexDateItem == index
                      ? Color(0xFF2AB364)
                      : Color(0XffA6A6A6),
                  backgroundColor: indexDateItem == index
                      ? Color(0xFFB5E8D0)
                      : Color(0xFFFAFAFA)),
              onPressed: () {
                setState(() {
                  indexDateItem = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${1 + index} ',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${nameDay[index]}',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listAlarmUser() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: alarmUser.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: 5),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color(0xFFFAFAFA),
                      elevation: 0),
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${alarmUser.values.elementAt(index)}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF141414),
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.normal),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                '${alarmUser.keys.elementAt(index)}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF141414),
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SvgPicture.asset('assets/Icons/Alarm.svg')
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }

  Widget textExplore() {
    return Container(
      margin: EdgeInsets.only(left: 23, top: 39),
      child: Text(
        'Explore',
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            fontFamily: 'Work Sans',
            color: Color(0xFF141414)),
      ),
    );
  }

  Widget menuExplore() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 25, top: 10.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: iconMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: SizedBox(
              width: 98,
              height: 90,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: indexMenuItem == index
                          ? Color(0xFF2AB364)
                          : Color(0XffA6A6A6),
                      backgroundColor: indexMenuItem == index
                          ? Color(0xFFB5E8D0)
                          : Color(0xFFFAFAFA)),
                  onPressed: () {
                    setState(() {
                      indexMenuItem = index;
                    });
                    if (index == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QilbaHome()));
                    }
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrayerHome()));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        '${iconMenu.values.elementAt(index)}',
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          iconMenu.keys.elementAt(index),
                          style: TextStyle(
                              fontFamily: 'Work Sans',
                              color: MaterialStateColor.resolveWith(
                                (states) {
                                  if (index > 1) {
                                    return Color(0xFFEBEBEB);
                                  }
                                  return Color(0xFF141414);
                                },
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textLatestArticles() {
    return Container(
      margin: EdgeInsets.only(top: 49.5, left: 21),
      child: Text('Latest Articles',
          style: TextStyle(
            color: Color(0xFF141414),
            fontSize: 14,
            fontFamily: 'Work Sans',
          )),
    );
  }

  Widget Articles() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 232,
            height: 90,
            padding: EdgeInsets.only(left: 10),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              surfaceTintColor: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFD9D9D9)),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 2),
                          child: Text(
                            'Education',
                            style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontSize: 10,
                                color: Color(0xFF141414)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFF141414),
                                fontSize: 12,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 3, left: 10),
                          child: Row(
                            children: const [
                              Text(
                                'Mohammed Yusuf',
                                style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontSize: 10,
                                    color: Color(0xFF141414)),
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Text(
                                '13 Feb 2023',
                                style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontSize: 10,
                                    color: Color(0xFF141414)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
