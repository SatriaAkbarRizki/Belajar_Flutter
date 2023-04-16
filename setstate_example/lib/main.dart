import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeApp> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              '$number',
              style: GoogleFonts.lato(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  child: Text(
                    'Nambah',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      number--;
                    });

                    if (number < 0) {
                      final snackBar = SnackBar(
                        content: Text(
                            'Angka tidak boleh dibawah 0, angka direset ke 0'),
                        action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                            textColor: Colors.green),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      setState(() {
                        number = 0;
                      });
                    }
                  },
                  child: Text(
                    'Kurang',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
