import 'package:flutter/material.dart';
import '../userPage/tiltle.dart';
import '../userPage/options.dart';
import '../userPage/commen.dart';


class Users extends StatefulWidget {
  Users({Key key}) : super(key: key);

  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        bottom: 30
      ),
      children: <Widget>[
         Column(
          children: <Widget>[
            ImageTitle(),
            OptionsList(),
            Commen('账号与安全',0,'立即确认'),
            Commen('签到领红包', 1, '立即领取')
          ],
         )
        ]
      );
  }
}


