import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter_app/model/likeMoives.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/homeData.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NewMoive extends StatefulWidget {
  NewMoive({Key key}) : super(key: key);

  _NewMoiveState createState() => _NewMoiveState();
}

class _NewMoiveState extends State<NewMoive> with AutomaticKeepAliveClientMixin{
  // 保持页面状态需要继承一下AutomaticKeepAliveClientMixin然后设置一下wantKeepAlive
  @override
  bool get wantKeepAlive =>true;
  Future _getmoivedata;

  List<Widget> listDataM = new List();
  @override
  void initState() {
    _getmoivedata = getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final likeStore = Provider.of<LikeMoives>(context);
    return FutureBuilder(
      future: _getmoivedata,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          print('===========列表页数据');
          List<Map> dataMovie = (snapshot.data['subjects'] as List).cast();
          // 拿到数据后对每个对象添加islike属性
          if(likeStore.value.length > 0) {
            for(var j=0;j<likeStore.value.length;j++){
              for(var i =0;i<snapshot.data['subjects'].length;i++) {
                if(likeStore.value[j]['id'] == snapshot.data['subjects'][i]['id']){
                  snapshot.data['subjects'][i]['islike'] = true;
                }
              }
            }
          }
          return ListView.builder(
            itemCount: snapshot.data['subjects'].length,
            itemBuilder: (BuildContext context, int position) {
              return ListtileW(position, dataMovie);
            },
          );
        }else {
          return Center(
            child: Text('正在读取数据'),
          );
        }
      },
    );
    
  }
}

// listviewbuilder里面不能直接嵌套statefulwidget，如果需要修改值需要在嵌套一层
class ListtileW extends StatelessWidget {
  int postion;
  List<Map> listdata;
  ListtileW(this.postion,this.listdata);
  @override
  Widget build(BuildContext context) {
    return LikeIcon(postion, listdata);
  }
}

class LikeIcon extends StatefulWidget {
  final postion;
  final listdata;
  LikeIcon(this.postion,this.listdata);
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  bool islike=false;
  
  @override
  void initState() {
    
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final likeStore = Provider.of<LikeMoives>(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFd9d9d9)),
              ),
      ),
      height: 100,
      child: ListTile(
        leading: Container(
          child: Image.network(widget.listdata[widget.postion]['images']['large']),
        ),
        title: Text(widget.listdata[widget.postion]['title']),
        subtitle: Text(widget.listdata[widget.postion]['genres'].toString()),
        trailing: widget.listdata[widget.postion]['islike'] ? Icon(Icons.sentiment_very_satisfied,color : Colors.orange):Icon(Icons.sentiment_neutral),
        onLongPress: () {
          setState(() {
            widget.listdata[widget.postion]['islike'] = !widget.listdata[widget.postion]['islike'];
          });
          if(widget.listdata[widget.postion]["islike"]) {
            Fluttertoast.showToast(
              msg: "收藏成功了~",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0
          );
          }else {
             Fluttertoast.showToast(
              msg: "取消收藏成功",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0
          );
            
          }
          likeStore.increment(widget.listdata[widget.postion]);
        },
        onTap: (){
          
        },
      ),
    );
  }
}