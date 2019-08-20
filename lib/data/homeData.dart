import 'package:dio/dio.dart';
import 'dart:async';
import '../config/requestUrl.dart';
const _apikey = '?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd';
// 请求头数据需要统一配置
// var dio = new Dio(new BaseOptions(
//     baseUrl: "http://www.dtworkroom.com/doris/1/2.0.0/",
//     connectTimeout: 5000,
//     receiveTimeout: 100000,
//     // 5s
//     headers: {
//       HttpHeaders.userAgentHeader: "dio",
//       "api": "1.0.0",
//     },
//     contentType: ContentType.json,
//     // Transform the response data to a String encoded with UTF8.
//     // The default value is [ResponseType.JSON].
//     responseType: ResponseType.plain,
//   )); 

Future getHomeData() async {
  try {
    Response response;
    response = await Dio().get(
        MOIVEREQUEST + MOIVEAPILIST[0] + _apikey);
    return response.data;
  } catch (e) {
    return print(e);
  }
}

Future getListData() async {
  try {
    Response response;
    response = await Dio().get(
        MOIVEREQUEST + MOIVEAPILIST[1] + _apikey);
        for(var i=0;i<response.data['subjects'].length;i++) {
            response.data['subjects'][i]['islike'] = false;
          }
    return response.data;
  } catch (e) {
    return print(e);
  }
}

Future getComingData() async {
  try {
    Response response;
    response = await Dio().get(
        MOIVEREQUEST + MOIVEAPILIST[2] + _apikey);
    return response.data;
  } catch (e) {
    return print(e);
  }
}
