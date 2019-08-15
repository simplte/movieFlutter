import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget{
  const UserAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('我',textAlign: TextAlign.center,style: TextStyle(color:Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:Icon(Icons.add_circle),
          color: Colors.black,
          onPressed: (){
            print('添加好友');
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          
          IconButton(
          
            icon: Icon(Icons.image_aspect_ratio),
            color: Colors.black,
            onPressed: (){
              print('扫一扫');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: (){
              print('设置');
            },
          )
        ],
    );
  }

  @override
  Size get preferredSize => getSize();
  Size getSize(){
    return new Size(100.0, 50.0);
  }
}
