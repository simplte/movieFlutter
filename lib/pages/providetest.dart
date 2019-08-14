import 'package:flutter/material.dart';
// 将用到管理的撞他放到对应的组件中
import 'package:provider/provider.dart';
import '../model/counter.dart';

class ProvideTest extends StatefulWidget {
  ProvideTest({Key key}) : super(key: key);

  _ProvideTestState createState() => _ProvideTestState();
}

class _ProvideTestState extends State<ProvideTest> {
  @override
  Widget build(BuildContext context) {
  final _counter = Provider.of<CounterModel>(context);
  final textSize = Provider.of<int>(context).toDouble();
   return Scaffold(
      appBar: AppBar(
        title: Text(_counter.value.toString()),
      ),
      body: Center(
        child: Text(textSize.toString()),
      ),
    );
  }
}
