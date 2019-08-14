import 'package:flutter/material.dart';
class ExpansionParnelListDemo extends StatefulWidget {
  final expandList;
  ExpansionParnelListDemo(this.expandList,{Key key}) : super(key: key);
  _ExpansionParnelListDemoState createState() => _ExpansionParnelListDemoState();
}

class _ExpansionParnelListDemoState extends State<ExpansionParnelListDemo> {
  List exList;
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
        print(item);
        if(item.index == index){
          item.isOpen = !isExpand;
        }
      });
    });
  }
  _setData(List<Map> _listdata){
    for(var i=0;i<_listdata.length;i++){
      expandStateList.add(ExpandStateBean(_listdata[i]['index'],false));
    }
  }


  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.expandList);
    _setData(widget.expandList);
    
    List<Map> _mapdata = widget.expandList;
    return ExpansionPanelList(
          expansionCallback: (index,bol){
            _setCurrentIndex(index,bol);
          },
          
          // 内容区域
          children: _mapdata.map((item){
            return ExpansionPanel(
              // 上下文 是否是打开的
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('我是标题.${item['cname']}'),
                );
              },
              body: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('data'),
                  
                ],
              ),
              ),
              // 判断是否打开
              isExpanded: expandStateList[item['index']].isOpen
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