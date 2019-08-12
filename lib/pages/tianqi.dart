import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TianQi extends StatelessWidget {
  final arguments;
  TianQi({this.arguments});
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      appBar: AppBar(
        title: Text("天气预报"),
      ),
      body: Text("asdf${arguments!=null ? arguments['title']: '0'}"),
    );
  }
  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get('https://movie.douban.com/j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0');
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
  
}

