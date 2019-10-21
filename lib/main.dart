import 'package:flutter/material.dart';
// 引入provide状态管理包
import 'package:provider/provider.dart';
// 将定义好的状态管理文件引进来
import 'routes/Route.dart';
import 'package:flutter_app/model/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: PorviderList,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home:Tabs(),
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute);
  }
}
