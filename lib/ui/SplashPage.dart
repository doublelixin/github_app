import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/HomePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  startTime() async {
    timer = new Timer(const Duration(seconds: 2), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(
                //跳转到主页
                builder: (BuildContext context) => new HomePage()),
            (Route route) => route == null);
      } catch (e) {}
    });
    return timer;
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/logo.png'),
      ),
    );
  }
}
