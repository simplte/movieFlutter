import 'package:flutter/material.dart';
class ExpansionData with ChangeNotifier{
  List _expansinData = new List();
  List get value => _expansinData;
  void increment(val) {
    _expansinData = val;
    notifyListeners();
  } 
}