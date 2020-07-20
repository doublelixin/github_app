import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/HomePage.dart';

import 'SplashPage.dart';

void main() {
  runApp(new MaterialApp(
    //去除右上角的Debug标签
    debugShowCheckedModeBanner: false,
    title: '启动图demo',
    theme: new ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        platform: TargetPlatform.iOS),
    home: new SplashPage(),
//    routes: <String, WidgetBuilder>{
//      '/home': (BuildContext context) => new HomePage()
//    },
  ));
}
//
//class SplashScreen extends StatefulWidget {
//  @override
//  _SplashScreenState createState() => new _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  startTime() async {
//    //设置启动图生效时间
//    var _duration = new Duration(seconds: 5);
//    return new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    //Navigator.of(context).pushReplacementNamed('/home');
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    startTime();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Center(
//        child: new Image.asset('images/logo.png'),
//      ),
//    );
//  }
//}
