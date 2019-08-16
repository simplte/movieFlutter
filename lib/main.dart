import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
// 引入provide状态管理包
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'routes/Route.dart';
import 'model/likeMoives.dart';


void main(){
  final counter = CounterModel();
  final likeMoives = LikeMoives();
  final textSize = 22;
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: textSize,),
        ChangeNotifierProvider.value(value: counter,),
        ChangeNotifierProvider.value(value: likeMoives,)
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 16,color: Colors.white),
      backgroundColor: Colors.grey..withAlpha(200),
      radius: 8,
      child:MaterialApp(
            debugShowCheckedModeBanner: false,
            // home:Tabs(),
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute
          )
    );
    
    
  }
}