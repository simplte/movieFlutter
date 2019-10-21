import 'package:flutter/material.dart';

class LikeMoives with ChangeNotifier {
  List _likeMoiveList = new List();
  List get value => _likeMoiveList;
  void increment(val) {
    int idx = -1;
    if (_likeMoiveList.length > 0) {
      for (var i = 0; i < _likeMoiveList.length; i++) {
        if (_likeMoiveList[i]['id'] == val['id']) {
          idx = i;
        }
      }
      if (idx >= 0) {
        _likeMoiveList.removeAt(idx);
      } else {
        _likeMoiveList.add(val);
      }
    } else {
      _likeMoiveList.add(val);
    }
    print(_likeMoiveList.length);
    notifyListeners();
  }
}
