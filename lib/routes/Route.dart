import 'package:flutter/material.dart';
import '../pages/userInfo.dart';
import '../pages/moiveItem.dart';
import '../pages/tianqi.dart';
import '../Tabs.dart';
import '../pages/providetest.dart';
import '../pages/likeMoiveStore.dart';


final routes = {
  '/':(context) => Tabs(),
  '/moiveitem': (context) => MoiveItem(),
  '/userinfo': (context,{arguments}) => UserInfo(arguments:arguments),
  '/tianqi': (context, {arguments}) => Tianqi(),
  '/providetest':(context) => ProvideTest(),
  '/likemoive':(context)=>LikeMoiveStore()
};
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else {
    final Route route = MaterialPageRoute(builder: (context) => Tabs());
    return route;
  }
};
