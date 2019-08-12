import 'package:flutter/material.dart';

class NewMoive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _imgUrl =
        'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp';
    return ListView(
      children: <Widget>[
        ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),
         ContainerTabs(_imgUrl,'甄嬛传','我是甄嬛的自我介绍随便系诶些'),
        SizedBox(height: 5,),

      ],
    );
  }
}
class ContainerTabs extends StatelessWidget {
  String _img;
  String _title;
  String _subtitle;
  ContainerTabs(this._img,this._title,this._subtitle);
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              child: Image.network(_img),
            ),
            title: Text(_title),
            subtitle: Text(_subtitle),
            onLongPress: (){
              print('33333');
              
            },
          ),
        );
  }
}

class TipsBtn extends StatelessWidget {
  const TipsBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      child: new Text('甄嬛点我，快点我'),
      onPressed: (){
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('标题'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('甄嬛点我点到点我')
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('好的'),
                  onPressed: (){
                    // Navigator.pushNamed(context, '/moiveitem');
                  },
                )
              ],
            );
          }
        );
      },
    );
  }
}