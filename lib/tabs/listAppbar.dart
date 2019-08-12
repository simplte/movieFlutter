import 'package:flutter/material.dart';

class ListAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
         title: Text('列表',style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         centerTitle: true,
         bottom: TabBar(
           isScrollable: true,
           indicatorWeight:4,
           labelColor: Colors.black,
           tabs: <Widget>[
             Tab(text: '最新',),
             Tab(text: '推荐',),

             Tab(text: '经典',),

             Tab(text: '好评',),
           ],
         ),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();
  Size getSize(){
    return new Size(100.0, 100.0);
  }
}