import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsearch/fsearch.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiscoverHome(),
    );
  }
}

class DiscoverHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateDiscover();
  }
}

class StateDiscover extends State<DiscoverHome> {
  int indexDateItem = -1;
  List<String> categoryList = <String>[
    'All',
    'Da’wah',
    'Parenting',
    'Hajj',
    'Relationship',
    'Daily Life',
    'Umrah',
    'Shalat',
    'Shalat',
    'Education'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, top: 53),
            child: Text(
              'Discover',
              style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 36,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 24, top: 5),
            child: Text(
              'Content from Hijr contributors',
              style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 14,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 21, top: 36),
            child: OutlineSearchBar(
              icon: Icon(
                Icons.search_rounded,
                color: Color(0xFFCECFD3),
              ),
              borderColor: Color(0XFFF7F6F9),
              backgroundColor: Color(0xFFF7F6F9),
              hideSearchButton: true,
              borderRadius: BorderRadius.circular(5),
              hintText: 'Search something',
              hintStyle: TextStyle(
                  color: Color(0xFFCECFD3),
                  fontFamily: 'Work Sans',
                  fontSize: 12),
            ),
          ),
          categoryScrollable(),
          Articles()
        ],
      ),
    );
  }

  Widget categoryScrollable() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20, top: 5, bottom: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  foregroundColor: indexDateItem == index
                      ? Color(0xFFFAFAFA)
                      : Color(0XffA6A6A6),
                  backgroundColor: indexDateItem == index
                      ? Color(0xFF2AB364)
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
                    '${categoryList[index]}',
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

  Widget Articles() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 232,
            height: 90,
            padding: EdgeInsets.only(left: 20, right: 13),
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
                            'Breaking News: Free college tuition for everyone',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFF141414),
                                fontSize: 12,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 17, left: 10),
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

            // child: OutlineSearchBar(
            //   icon: Icon(Icons.fiber_dvr),
            //   borderColor: Color(0XFFF7F6F9),
            //   backgroundColor: Color(0xFFF7F6F9),
            //   hideSearchButton: true,
            //   borderRadius: BorderRadius.circular(5),
            //   hintText: 'Search something',
            //   hintStyle: TextStyle(
            //       color: Color(0xFFCECFD3),
            //       fontFamily: 'Work Sans',
            //       fontSize: 12),
            // ),

            // FSearch(
            //       width: 319,
            //       height: 48,
            //       backgroundColor: Colors.red,
            //       style: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.grey),
            //       margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
            //       padding: EdgeInsets.only(
            //           left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
            //       prefixes: [
            //         const SizedBox(width: 6.0),
            //         Icon(
            //           Icons.search,
            //           size: 18,
            //           color: Colors.black,
            //         ),
            //         const SizedBox(width: 3.0)
            //       ])