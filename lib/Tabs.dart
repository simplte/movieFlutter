import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/MovieList.dart';
import 'tabs/User.dart';

import 'tabs/userAppbar.dart';
import 'tabs/homeAppbar.dart';
import 'tabs/listAppbar.dart';
import 'tabs/leftDrawer.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    MoiveList(),
    Users(),
  ];
  List _divAppBar = [HomeAppBar(), ListAppBar(), UserAppBar()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // 标题
        appBar: this._divAppBar[this._currentIndex],
        // 底部凸起按钮
        floatingActionButton: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey,
          ),
          child: FloatingActionButton(
            child: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                this._currentIndex = 1;
              });
            },
            backgroundColor:
                this._currentIndex == 1 ? Colors.orangeAccent : Colors.blueGrey,
          ),
        ),
        // 凸起按钮位置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // 页面呈现的内容
        body: this._pageList[this._currentIndex],
        // 底部tab
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('主页'),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('列表')),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), title: Text('我'))
          ],
        ),
        // 左侧抽屉框
        drawer: LeftDrawer()),
    );
  }
}
