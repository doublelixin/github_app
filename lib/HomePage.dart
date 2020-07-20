import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

/* 创建一个无状态的 Widget */
class _HomePageState extends State<HomePage> {
  /*查看源码也可以知道 StatelessWidget 是一个抽象类，
     由于我们是自定义的 StatelessWidget 所以需要复写 build 方法*/

  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
    return new MaterialApp(
      //去除右上角的Debug标签
      debugShowCheckedModeBanner: false,
      title: 'github', // 设置 App 的标题
      theme: new ThemeData(primaryColor: Colors.blue), // 设置主题颜色

      // Scaffold 存在于 Material 库中。实现了基本的 material 布局。
      // 可以使用 scaffold 实现比较复杂的布局，可以先简单理解 scaffold 为一个容器，可以在上面实现布局
      home: new Scaffold(
        body: new Center(
          child: new Text('hello world'),
        ),
      ),
    );
  }
}
