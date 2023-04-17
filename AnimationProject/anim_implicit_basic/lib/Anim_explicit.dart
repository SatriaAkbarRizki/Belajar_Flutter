import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExplicitHome(),
    );
  }
}

class ExplicitHome extends StatefulWidget {
  ExplicitState createState() => ExplicitState();
}

class ExplicitState extends State<ExplicitHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        animationBehavior: AnimationBehavior.preserve,
        duration: Duration(seconds: 10),
        vsync: this)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: TimeStopper(
              controller: _animationController,
            ),
          ),
          Align(
            child: RotationTransition(
              alignment: Alignment.center,
              child: Image.asset('assets/linux_icon.png'),
              turns: _animationController,
            ),
          )
        ],
      ),
    );
  }
}

class TimeStopper extends StatelessWidget {
  final AnimationController controller;

  const TimeStopper({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isAnimating) {
          controller.stop();
        } else {
          controller.repeat();
        }
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
