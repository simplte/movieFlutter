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
                  accountName: Text('卜前程您好'),
                  accountEmail: Text('6575734@qq.com'),
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
          
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.supervised_user_circle,color: Colors.cyan,),
            ),
            title: Text('我'),
            onTap: (){
              Navigator.of(context).pop();// 关闭侧边栏
              Navigator.pushNamed(context, '/userinfo');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.email,color: Colors.cyan,),
            ),
            title: Text('最新信息'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/moiveitem');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.movie,color: Colors.cyan,),
            ),
            title: Text('热播电影'),
            onTap: (){
              Navigator.of(context).pop();// 关闭侧边栏
              Navigator.pushNamed(context, '/tianqi');
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.movie,color: Colors.cyan,),
            ),
            title: Text('providetest'),
            onTap: (){
              Navigator.pushNamed(context, '/providetest');
            },
          ),
        ],
      )
    );
  }
}