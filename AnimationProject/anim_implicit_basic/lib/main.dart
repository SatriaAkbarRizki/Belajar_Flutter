import 'package:flutter/material.dart';
import 'Anim_explicit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExplicitHome(),
    );
  }
}

class HomeApp extends StatefulWidget {
  _HomeApp createState() => _HomeApp();
}

class _HomeApp extends State<HomeApp> {
  bool sizeImage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                alignment: Alignment.center,
                width: sizeImage ? 200 : 500,
                child: Image.asset('assets/android_icon.png'),
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sizeImage = !sizeImage;
                    });
                  },
                  child: Text('Ubah Ukuran'))
            ],
          ),
        ),
      ),
    );
  }
}
