import 'package:flutter/material.dart';
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: Text('卜前程您好',style: TextStyle(color: Colors.white),),
                  accountEmail: Text('6575734@qq.com',style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565880938193&di=25a15323acffa5cb7b2bd1253479e32b&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F27%2F20150527160400_iYmE3.jpeg',
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565880938036&di=b6b50200295ec2d7a09faab55a472c73&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201605%2F26%2F20160526165127_ywd5F.jpeg'),
                      fit: BoxFit.cover
                    ) 
                  ),
              )
              )
            ],
          ),
          
          _listTileW(Icons.supervised_user_circle,'我','/userinfo'),
          Divider(),
          _listTileW(Icons.email,'最新信息','/moiveitem'),
          Divider(),
          _listTileW(Icons.movie,'热播电影','/tianqi'),
          Divider(),
          _listTileW(Icons.pages,'喜欢的电影','/likemoive'),
        ],
      )
    );
  }
}

class _listTileW extends StatelessWidget {
  final _icon;
  final _title;
  final _tourl;
  const _listTileW(this._icon,this._title,this._tourl,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: CircleAvatar(
              child: Icon(_icon,color: Colors.cyan,),
            ),
            title: Text(_title),
            onTap: (){
              Navigator.of(context).pop();// 关闭侧边栏
              Navigator.pushNamed(context, _tourl);
            },
          );
  }
}