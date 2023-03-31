import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First My Application",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First My Application"),
        ),
        body: const Center(
          child: Text("Hello Satria"),
        ),
      ),
    );
  }
}
