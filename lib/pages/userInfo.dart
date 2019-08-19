import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_app/utils/request.dart';
class UserInfo extends StatefulWidget {
  UserInfo({Key key}) : super(key: key);

  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String dataLists;
  void getHttp() async {
    try {
      //banner
      var bannerResponse = await HttpUtil().get('coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd');
      print(bannerResponse);
      print('========');
      setState(() {
        dataLists=bannerResponse.data.toString();
      });
      print(dataLists);
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
      getHttp();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户详情页面'),
      ),
      body: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        //下拉刷新
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            getHttp();
          });
        },
        // 加载更多数据
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () async {
           print('eeee');
          });
        },
        
        child: Text('$dataLists'),
      ),
    );
  }
  
}
