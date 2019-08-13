import 'package:dio/dio.dart';
import 'dart:async';
import '../config/requestUrl.dart';
const _apikey = '?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd';
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
