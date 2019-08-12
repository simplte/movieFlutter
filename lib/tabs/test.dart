import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import '../pages/moiveItem.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String _imageUrl =
      'https://img1.doubanio.com/view/photo/l/public/p2561876698.webp';
  List<Widget> _movieList;
  Map _wl;
  
  List<Widget> _handleMoiveList(data) {
    List _list = data['subjects'];
    if(_list.length <= 0) {
      List<Widget> listdata;
      listdata.add(
        Text('wwww')
      );
      return listdata;
    }
    var wMoiveList = _list.map((item) {
      return Container(
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
                            image: NetworkImage(_imageUrl), fit: BoxFit.cover),
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
                              "${item['title']}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text("上映时间:", style: TextStyle(color: Colors.grey)),
                            Text(
                              "${item['mainland_pubdate']}",
                            ),
                            Text(
                              "时长:${item['durations'][0]}",
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )))
              ],
            ),
      );
    });
    return wMoiveList.toList();
  }
  
  Widget build(BuildContext context) {
    getHttp().then((info) {
        setState(() {
        this._movieList = this._handleMoiveList(info);
      });
    });
    return GridView.count(
        crossAxisCount: 2, childAspectRatio: 1.7, children: this._movieList.length > 0 ? this._movieList: <Widget>[
          Text('请求数据中')
        ], );
  }
}

Future getHttp() async {
  try {
    Response response;
    response = await Dio().get(
        "http://192.168.1.88:8080/api/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a");
    return response.data;
  } catch (e) {
    return print(e);
  }
}

