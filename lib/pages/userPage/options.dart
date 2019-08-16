import 'package:flutter/material.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 130,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OptionBtn('img', '我的相册'),
                OptionBtn('img', '我的故事'),
                OptionBtn('img', '我的赞'),
                OptionBtn('img', '粉丝服务'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OptionBtn('img', '微博钱包'),
                OptionBtn('img', '微博优选'),
                OptionBtn('img', '粉丝头条'),
                OptionBtn('img', '客服中心'),
              ],
            ),
          ],
    ));
  }
}

class OptionBtn extends StatelessWidget {
  String _icontType;
  String _name;
  OptionBtn(this._icontType, this._name);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Icon(
              Icons.image,
              color: Colors.blue[200],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(this._name),
          )
        ],
      ),
    );
  }
}
