import 'package:flutter/material.dart';

class MoiveItem extends StatefulWidget {
  MoiveItem({Key key}) : super(key: key);

  _MoiveItemState createState() => _MoiveItemState();
}

class _MoiveItemState extends State<MoiveItem> {
  int currentIndex = 0;
  List _dataList = ['WOMAN', "MAN", "KIDS", "BOBY"];
  List _recommendList = ['特级一览', "本周新品", "限时特惠", "本周超值精选"];
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
          alignment:  Alignment.centerLeft,
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
            )
         
        ),
        onTap: (){
          print(currentIndex);
        },
      ));
    }
    return _recommendListw;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: ListView(
        children: <Widget>[
          LinkImg(),
          ServiceImg(),
          _groupClassW(),
          _recommendListW(),
          SizedBox(height: 20,),
          ExpansionParnelListDemo()
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
    return Column(
      children: _recommendlistfun()
    );
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

class ExpansionParnelListDemo extends StatefulWidget {
  ExpansionParnelListDemo({Key key}) : super(key: key);

  _ExpansionParnelListDemoState createState() => _ExpansionParnelListDemoState();
}

class _ExpansionParnelListDemoState extends State<ExpansionParnelListDemo> {
  
  List<int> mList;
  // 存放状态和索引List
  List<ExpandStateBean> expandStateList;

  _ExpansionParnelListDemoState(){
    mList = new List();
    expandStateList = new List();
    for(int i = 0; i < 10; i ++){
      mList.add(i);
      // 第一个是索引，第二个是否打开;
      expandStateList.add(ExpandStateBean(i,false));
    }
  }

  // 判断用户点击是否打开
  _setCurrentIndex(int index, isExpand){
    setState(() {
      // 循环判断用户点击和索引是否一致，并操作状态
      expandStateList.forEach((item){
        if(item.index == index){
          item.isOpen = !isExpand;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
          expansionCallback: (index,bol){
            _setCurrentIndex(index,bol);
          },
          // 内容区域
          children: mList.map((index){
            return ExpansionPanel(
              // 上下文 是否是打开的
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('我是标题.$index'),
                );
              },
              body: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
              ),
              // 判断是否打开
              isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        );
  }
}
// 控制打开和关闭的类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}