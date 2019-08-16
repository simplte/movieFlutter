import 'package:flutter/material.dart';
class ExpansionParnelListDemo extends StatefulWidget {
  ExpansionParnelListDemo(this.expandList, {Key key}) : super(key: key);

  final expandList;

  _ExpansionParnelListDemoState createState() =>
      _ExpansionParnelListDemoState();
}

class _ExpansionParnelListDemoState extends State<ExpansionParnelListDemo> {
  _ExpansionParnelListDemoState() {
    expandStateList = new List();
  }
    // 存放状态和索引List
  List<ExpandStateBean> expandStateList;
  ScrollController _scrollController = ScrollController();
    @override
  void dispose() {
     _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  // 判断用户点击是否打开
  _setCurrentIndex(int index, isExpand) {
    setState(() {
      // 循环判断用户点击和索引是否一致，并操作状态
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  _setData(List<Map> _listdata) {
    print('========');
    for (var i = 0; i < _listdata.length; i++) {
      expandStateList.add(ExpandStateBean(_listdata[i]['index'], false));
    }
  }


  Widget getRow(int i, List item) {
    print(item);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: ListTile(
          title: Text(
            item[i]
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.expandList);
    _setData(widget.expandList);

    List<Map> _mapdata = widget.expandList;
      
    return SingleChildScrollView(
        controller: _scrollController,
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },

          // 内容区域
          children: _mapdata.map((item) {
            return ExpansionPanel(
                // 标题
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('${item['cname']}'),
                  );
                },
                //展开的内容
                body: Container(
                  height: 200, // 一定要有高度，否则会报错
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                    itemCount: item['list'].length,
                    itemBuilder: (BuildContext context, int position){
                      return getRow(position, item['list']);
                    },
                  )
                ),
                // 判断是否打开
                isExpanded: expandStateList[item['index']].isOpen);
          }).toList(),
        )
      );
  }
}

// 控制打开和关闭的类
class ExpandStateBean {
  ExpandStateBean(this.index, this.isOpen);

  var index;
  var isOpen;
}
