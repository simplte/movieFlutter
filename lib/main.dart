import 'package:flutter/material.dart';
// 引入provide状态管理包
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'routes/Route.dart';
import 'model/selectExpansion.dart';


void main(){
  final counter = CounterModel();
  final expansionData = ExpansionData();
  final textSize = 22;
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: textSize,),
        ChangeNotifierProvider.value(value: counter,),
        ChangeNotifierProvider.value(value: expansionData,)
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
      onGenerateRoute: onGenerateRoute
    );
  }
}