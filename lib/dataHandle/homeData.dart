import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

Future getHomeData() async {
  try {
    Response response;
    response = await Dio().get(
        "http://192.168.1.88:8080/api/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a");
    return response.data;
  } catch (e) {
    return print(e);
  }
}