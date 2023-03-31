import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  AppDesainBasic createState() => AppDesainBasic();
}

class AppDesainBasic extends State<Home> {
  StreamSubscription? connection;
  var isDeviceConnect = false;
  bool isAlert = false;

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => {
        connection = Connectivity()
            .onConnectivityChanged
            .listen((ConnectivityResult result) async {
          isDeviceConnect = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnect && isAlert == false) {
            showMessageOffline();
            setState(() => isAlert = true);
          }
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desain Dasar Aplikasi'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message_outlined),
            tooltip: 'Message',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button to Message')));
            },
          ),
          IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.people),
              onPressed: () async => (Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Profile User'),
                        ),
                        body: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.network(
                              'https://i.pinimg.com/550x/4f/24/d0/4f24d0a794fecb31cae21973f6314fba.jpg',
                              loadingBuilder: (BuildContext context, child,
                                  ImageChunkEvent? loaloadingProgress) {
                            if (loaloadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loaloadingProgress.expectedTotalBytes !=
                                        null
                                    ? loaloadingProgress.cumulativeBytesLoaded /
                                        loaloadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }),
                        )),
                  )))),
        ],
      ),
    );
  }

  showMessageOffline() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Peringatan"),
              content: const Text("Tidak Ada Jaringan"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, 'ok'),
                    child: const Text('ok'))
              ],
            ));
  }
}
