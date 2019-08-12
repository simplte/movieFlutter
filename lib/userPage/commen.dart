import 'package:flutter/material.dart';

class Commen extends StatelessWidget {
  String _title;
  int _contentInx;
  String _btnStr;
  Commen(this._title, this._contentInx, this._btnStr);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      constraints: BoxConstraints(minHeight: 100),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          _contentInx == 0 ? Safe() : RedPacket(),
          Divider(),
          Container(
            alignment: Alignment.center,
            height: 30,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
            color: Colors.white70,
            child: GestureDetector(
              child: Text(
                _btnStr,
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                print('6666');
              },
            ),
          )
        ],
      ),
    );
  }
}

class Safe extends StatelessWidget {
  const Safe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(
              Icons.warning,
              color: Colors.redAccent,
              size: 60,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '你绑定的手机是181****1711吗?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '手机换号，可能导致无法正常使用微博',
                  style: TextStyle(fontSize: 14),
                ),
                Text('请确认是否已经换号',
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RedPacket extends StatelessWidget {
  const RedPacket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('连续签到有大额奖励，断签就要重新开始哦~'),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      size: 50,
                      color: Colors.orangeAccent[200],
                    ),
                    Text('今日签到')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('5个',style: TextStyle(color: Colors.green,fontSize: 35,fontWeight: FontWeight.w900),),
                    ),
                    Text('还可完成的任务')
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
