import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_easyrefresh/material_header.dart';
// import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_app/utils/request.dart';
import 'package:flutter_app/components/commenHeader.dart';
import 'package:flutter_app/components/conmmenFooter.dart';
import 'dart:convert';
class HotMoive extends StatelessWidget {
  const HotMoive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: RefressW(),
    );
  }
}
class RefressW extends StatefulWidget {
  RefressW({Key key}) : super(key: key);

  _RefressWState createState() => _RefressWState();
}

class _RefressWState extends State<RefressW> {
  List _moiveData = new List();
  String _imgUrl = "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2564956343.webp";
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: EasyRefresh(
        header: DeliveryHeader(),
        footer: PhoenixFooter(),
        onRefresh: () async{
          await Future.delayed(Duration(seconds: 1),(){
            getData();
          });
        },
        onLoad: () async{
          await Future.delayed(Duration(seconds: 1),(){

          });
        },
        child: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 1, //每行2个
                mainAxisSpacing: 5.0, //主轴(竖直)方向间距
                crossAxisSpacing: 10.0, //纵轴(水平)方向间距
                childAspectRatio: 1.9 //纵轴缩放比例
                
          ),
          // reverse: true,
          //   scrollDirection: Axis.horizontal,
           
          itemCount: _moiveData.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 175,
                            margin: EdgeInsets.all(10),
                            child: Image.network(_moiveData[position]['images']['small'],fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(top:10,left: 5,bottom: 5,right: 10),
                            height: 180,
                            alignment: Alignment.topLeft,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(_moiveData[position]['title'], 
                                 textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('主演：'),
                              ),
                              Expanded(
                                flex: 3,
                                child: ListView.builder(
                                  scrollDirection:Axis.horizontal,
                                  itemCount: _moiveData[position]['casts'].length, 
                                  itemBuilder: (BuildContext context, int idx) {
                                    return Column(
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          child: Image.network(_moiveData[position]['casts'][idx]['avatars'] != null?_moiveData[position]['casts'][idx]['avatars']['large'] :_imgUrl),
                                        ),
                                        Container(
                                          width: 40,
                                          child: Text(_moiveData[position]['casts'][idx]['name'],overflow:TextOverflow.ellipsis,),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('上映时间：${_moiveData[position]['mainland_pubdate']}', 
                                 textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color:Colors.grey),
                                ),
                              )
                            ],
                          ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 201,
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios)
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
        ),
      )
    );
  }
  Future getData() async {
    var loadData = await HttpUtil().get('coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd');
    Map dataMap = json.decode(loadData.toString());
    setState(() {
      _moiveData = dataMap['subjects'];
    });
  }
}