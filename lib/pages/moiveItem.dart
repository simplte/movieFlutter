import 'package:flutter/material.dart';
import '../components/expansionParnel.dart';
class MoiveItem extends StatefulWidget {
  MoiveItem({Key key}) : super(key: key);

  _MoiveItemState createState() => _MoiveItemState();
}

class _MoiveItemState extends State<MoiveItem> {
  int currentIndex = 0;
  List _dataList = ['WOMAN', "MAN", "KIDS", "BOBY"];
  List _recommendList = ['特级一览', "本周新品", "限时特惠", "本周超值精选"];
  List _classList = [
    [
      {
        'index':0,
        'cname': '裤子女的',
        'list': ['长裤子', '短裤子', '花裤子']
      },
      {
        'index':1,
        'cname': '裤子女的',
        'list': ['长裤子', '短裤子', '花裤子']
      },
    ],
    [
      {
        'index':0,
        'cname': '裤子男的',
        'list': ['长裤子', '短裤子', '花裤子']
      },
      {
        'index':1,
        'cname': '裤子男的',
        'list': ['长裤子', '短裤子', '花裤子']
      },
    ],
    [
      {
        'index':0,
        'cname': '裤子小孩',
        'list': ['长裤子', '短裤子', '花裤子']
      },
      {
        'index':1,
        'cname': '裤子小孩',
        'list': ['长裤子', '短裤子', '花裤子']
      },
    ],
    [
      {
        'index':0,
        'cname': '裤子婴儿',
        'list': ['长裤哈子', '短裤子', '花裤子']
      },
      {
        'index':1,
        'cname': '裤子婴儿',
        'list': ['长裤哈子', '短裤子', '花裤子']
      },
    ]
  ];
  List _expandData = new List();
  

  // Function
  List<Widget> _listfun() {
    List<Widget> _showList = new List();
    for (var i = 0; i < _dataList.length; i++) {
      _showList.add(this._labelW(_dataList[i], i));
    }
    return _showList;
  }

  List<Widget> _recommendlistfun() {
    List<Widget> _recommendListw = new List();
    for (var i = 0; i < _recommendList.length; i++) {
      _recommendListw.add(InkWell(
        child: Container(
            height: 60,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _recommendList[i],
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFd9d9d9)),
              ),
            )),
        onTap: () {
          print(currentIndex);
        },
      ));
    }
    return _recommendListw;
  }
  @override
  void initState() {
    _expandData = _classList[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('分类')
      ) ,
      body: ListView(
        children: <Widget>[
          Text(_expandData.toString()),
          LinkImg(),
          ServiceImg(),
          _groupClassW(),
          _recommendListW(),
          SizedBox(
            height: 20,
          ),
          ExpansionParnelListDemo(_expandData)
        ],
      ),
    );
  }






  // 类型tab列表
  Widget _groupClassW() {
    return Container(
      child: Row(
        children: _listfun(),
      ),
    );
  }

  //tab按钮
  Widget _labelW(String tabname, int idx) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            setState(() {
              this.currentIndex = idx;
              this._expandData = _classList[currentIndex];
            });
          },
          child: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  tabname,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      decoration:
                          currentIndex == idx ? TextDecoration.underline : null,
                      decorationColor:
                          currentIndex == idx ? Colors.blueGrey : null,
                      color: currentIndex == idx ? Colors.black : Colors.grey),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: currentIndex == idx ? Colors.white : Color(0xFFBDBDBD),
              border: Border(
                bottom: currentIndex == idx
                    ? BorderSide(width: 0, color: Colors.white)
                    : BorderSide(width: 0.5, color: Color(0xFFd9d9d9)),
                right: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)),
              ),
            ),
          ),
        ));
  }

  // 推荐列表
  Widget _recommendListW() {
    return Column(children: _recommendlistfun());
  }
}

// 顶部图片
class LinkImg extends StatelessWidget {
  const LinkImg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.blue,
    );
  }
}

//服务图片
class ServiceImg extends StatelessWidget {
  const ServiceImg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.red,
      child: GestureDetector(
        onTap: () {
          print('object');
        }, //写入方法名称就可以了，但是是无参的
        child: Text("dianji"),
      ),
    );
  }
}
