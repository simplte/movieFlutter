import 'package:flutter/material.dart';
import '../listPage/newMoive.dart';

class MoiveList extends StatefulWidget {
  MoiveList({Key key}) : super(key: key);

  _MoiveListState createState() => _MoiveListState();
}

class _MoiveListState extends State<MoiveList> {
  String _imgUrl =
      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp';
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        NewMoive(),
        ListView(
          children: <Widget>[
            ListTile(title: Text('data2'),),
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(title: Text('data2'),),
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(title: Text('data2'),),
          ],
        )
      ],
    );
  }
}