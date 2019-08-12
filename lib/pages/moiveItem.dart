import 'package:flutter/material.dart';
class MoiveItem extends StatefulWidget {
  MoiveItem({Key key}) : super(key: key);

  _MoiveItemState createState() => _MoiveItemState();
}

class _MoiveItemState extends State<MoiveItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影详情页'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('返回上一个页面'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

