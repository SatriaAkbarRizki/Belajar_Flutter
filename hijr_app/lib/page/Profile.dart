import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijr_app/page/Discover.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileHome(),
    );
  }
}

class ProfileHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateProfile();
  }
}

class StateProfile extends State<ProfileHome> {
  List<String> listMenuProfile = <String>[
    'About this app',
    'Changelog',
    'Terms of Service',
    'Privacy Policy',
    'Request feature',
    'About developer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          imagePass,
          Container(
            padding: EdgeInsets.only(left: 21, top: 6, right: 49),
            child: NameUser,
          ),
          MenuProfile(),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 24, top: 32),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Color(0xFFE94F1F),
                      fontSize: 12,
                      fontFamily: 'Work Sans'),
                )),
          ),
          VersionApp
        ],
      ),
    );
  }

  Widget imagePass = Container(
    padding: EdgeInsets.only(left: 23, top: 60),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/Icons/ProfileUser.svg',
          height: 60,
          width: 60,
        ),
        Container(
          padding: EdgeInsets.only(left: 154, right: 19),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Change password',
                style: TextStyle(
                    color: Color(0xFF2AB364),
                    fontFamily: 'Work Sans',
                    fontSize: 12),
              )),
        )
      ],
    ),
  );

  Widget NameUser = Row(
    children: [
      Wrap(children: [
        RichText(
            softWrap: true,
            text: const TextSpan(
                style: TextStyle(
                    fontSize: 36,
                    color: Color(0xFF141414),
                    fontFamily: 'Work Sans'),
                children: [
                  TextSpan(text: "Haikal\n"),
                  TextSpan(
                    text: 'Arifin Septiawan',
                  ),
                  TextSpan(
                      text: "\nhaikalseptiawan@gmail.com",
                      style: TextStyle(fontSize: 14))
                ])),
      ])
    ],
  );

  Widget MenuProfile() {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 50),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listMenuProfile.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                listMenuProfile[index],
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFF2AB364),
                    fontSize: 12,
                    fontFamily: 'Work Sans'),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget VersionApp = Container(
    padding: EdgeInsets.only(top: 87),
    child: Text(
      'Version 1.0.0',
      style: TextStyle(
          color: Color(0xFFBDBDBD), fontSize: 10, fontFamily: 'Work Sans'),
    ),
  );
}
