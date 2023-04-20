import 'package:kontak/main.dart';

import 'page/History.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeApp());
      case '/history':
        return MaterialPageRoute(builder: (_) => History());

      default:
        return _erorRoute();
    }
  }

  static Route<dynamic> _erorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(child: Text('Eror Page')),
            ));
  }
}
