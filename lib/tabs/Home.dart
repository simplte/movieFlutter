import 'package:flutter/material.dart';
import '../dataHandle/homeData.dart';
import '../components/swiperdiv.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  // 保证页面状态，切换页面后不重新请求数据
  bool get wantKeepAlive => true;
  String homePageContent = '获取数据中';
  List<Widget> listDataM = new List();
  List<Widget> _tabListFun(Map val) {
    List<Widget> _listMoiveDate = new List();
    for (var i = 0; i < val['subjects'].length; i++) {
      Map _itemData = val['subjects'][i];
      _listMoiveDate.add(Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border:
              Border.all(width: 2, color: Color.fromRGBO(255, 255, 255, 0.8)),
          color: Colors.white,
          boxShadow: [
            // 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            BoxShadow(
                color: Color(0xFF33B5E5),
                offset: Offset(0, 0.5),
                blurRadius: .2,
                spreadRadius: .2)
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${_itemData['images']['large']}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        //设置某一边圆角
                        topLeft: Radius.elliptical(10, 10),
                        bottomLeft: Radius.elliptical(10, 10))),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${_itemData['title']}",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        ),
                        Text("上映时间:", style: TextStyle(color: Colors.grey)),
                        Text(
                          "${_itemData['mainland_pubdate']}",
                        ),
                        Text(
                          "时长:${_itemData['durations']}",
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )))
          ],
        ),
      ));
    }
    return _listMoiveDate;
    // setState(() {
    //   listDataM = _listMoiveDate;
    // });
  }
  // 给futurebuild使用异步方法，放在initState中赋值保证页面只渲染一次
  Future _doctorsFuture;
  @override
  void initState() {
    // 保证页面渲染一次
    _doctorsFuture = getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 759,height: 1334)..init(context);
    return FutureBuilder(
      future: _doctorsFuture,
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          
          // 视屏教程上要转一下字符串 ，可能是现有接口返回的数据不需要处理吧
          // var data = json.decode(snapshot.toString());
          // List<Map> _dataObj = (data['subjects'] as List).cast();

          print('-========数据来了');
          return ListView(
            children: <Widget>[
              SwiperDiv(showSwipData: snapshot.data['subjects'].take(8).toList()),
              GridViewList(snapshot,_tabListFun),
            ],
          );
        } else {
          return LoadingTips();
        }
      },
    );
  }
}

// 双行组件
class GridViewList extends StatelessWidget {

  final snapshot;
  final callbackfun;
  GridViewList(this.snapshot, this.callbackfun);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(600.0),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        margin: EdgeInsets.only(top: 10),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
            children: callbackfun(snapshot.data)));
  }
}
// loading组件
class LoadingTips extends StatelessWidget {
  const LoadingTips({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('正在加载数据....',style: TextStyle(
        fontSize: 30,
      ),),
    );
  }
}
