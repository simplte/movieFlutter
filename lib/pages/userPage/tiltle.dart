import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
String _imgUrl =
      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp';
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 140,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          children: <Widget>[
                            ListTile(
                              leading: Container(
                                child: ClipOval(
                                  child: Image.network(
                                    _imgUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    scale: 2,
                                  ),
                                ),
                              ),
                              title: Text(
                                '用户名',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                              ),
                              subtitle: Text('简介：这个是简单的自我介绍'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 100,
                            alignment: Alignment.topCenter,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.verified_user,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '会员',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    '.',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MensList(30, '微博'),
                        MensList(302, '关注'),
                        MensList(67, '粉丝'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

class MensList extends StatelessWidget {
  int _count = 0;
  String _name;
  MensList(this._count, this._name);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this._count.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            this._name,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}