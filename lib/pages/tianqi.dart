import 'package:flutter/material.dart';

class TianQi extends StatelessWidget {
  final arguments;
  TianQi({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("天气预报"),
      ),
      body: Text("asdf${arguments!=null ? arguments['title']: '0'}"),
    );
  }
}