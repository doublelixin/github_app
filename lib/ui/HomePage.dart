import 'package:flutter/material.dart';
import 'package:flutter_app/utils/ToastUtil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("Github"),
        actions: <Widget>[
          //导航栏右侧分享菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: _drawer, //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text('Message')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    ToastUtil.toast(context, 'add');
  }

  // 抽屉Drawer案例
  get _drawer => Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              margin: EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('github'),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
            Divider(), //分割线
            Expanded(
                child: Container(
              color: Colors.transparent,
            )),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('关闭'),
              onTap: () => Navigator.pop(context), // 关闭抽屉
            )
          ],
        ),
      );
}
