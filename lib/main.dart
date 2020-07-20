import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/SplashPage.dart';

void main() {
  runApp(new MaterialApp(
    //去除右上角的Debug标签
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        platform: TargetPlatform.iOS),
    home: new SplashPage(),
  ));
}

