import 'package:provider/provider.dart';

import 'package:flutter_app/model/counter.dart';
import 'package:flutter_app/model/likeMoives.dart';

List<SingleChildCloneableWidget> PorviderList = [
  // 恒定值
  Provider.value(
    value: 11,
  ),
  //动态修改的值
  ChangeNotifierProvider(builder: (_) => CounterModel()),
  //动态修改的值
  ChangeNotifierProvider(builder: (_) => LikeMoives())
];
