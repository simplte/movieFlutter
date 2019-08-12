import 'package:flutter/material.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: Text('主页',style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         centerTitle: true,
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();
  Size getSize(){
    return new Size(100.0, 50.0);
  }
}