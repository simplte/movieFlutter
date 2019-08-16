import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_app/model/likeMoives.dart';

class LikeMoiveStore extends StatelessWidget {
  const LikeMoiveStore({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _likeListData = Provider.of<LikeMoives>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('电影收藏'),
        
      ),
      body: Container(
      height: 500,
      child: ListView.builder(
        itemCount: _likeListData.value.length,
        itemBuilder: (BuildContext context,int idx) {
          return ListTile(
            leading: Container(
              child:   Image.network(_likeListData.value[idx]['images']['large']),
            ),
            title: Text(_likeListData.value[idx]['title']),
          );
        },
      ),
    ),
    );
  }
}
