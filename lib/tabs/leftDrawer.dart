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
                    backgroundImage: NetworkImage('https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1565446326&di=5dbb8ac4a2e6494c71bece43603018be&src=http://b-ssl.duitang.com/uploads/item/201704/21/20170421083329_3cxt8.png',
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=369041081,2781921991&fm=26&gp=0.jpg'),
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
            title: Text('最新信息')
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.movie,color: Colors.cyan,),
            ),
            title: Text('热播电影')
          ),
          Divider(),
        ],
      )
    );
  }
}