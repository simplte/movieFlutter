import 'package:flutter/material.dart';
// 引入provide状态管理包
import 'package:provider/provider.dart';
// 将定义好的状态管理文件引进来
import 'model/counter.dart';
import 'routes/Route.dart';
import 'model/likeMoives.dart';

void main() {
  final counter = CounterModel();
  final likeMoives = LikeMoives();
  final textSize = 22;
  runApp(
    MultiProvider(
      providers: [
        // 恒定值
        Provider.value(
          value: textSize,
        ),
        //动态修改的值
        ChangeNotifierProvider.value(
          value: counter,
        ),
        //动态修改的值
        ChangeNotifierProvider.value(
          value: likeMoives,
        )
      ],
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
