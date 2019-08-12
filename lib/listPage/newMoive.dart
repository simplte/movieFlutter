import 'package:flutter/material.dart';
import '../dataHandle/homeData.dart';

class ContainerTabs extends StatelessWidget {
  String _img;
  String _title;
  List _subtitle;
  ContainerTabs(this._img, this._title, this._subtitle);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          child: Image.network(_img),
        ),
        title: Text(_title),
        subtitle: Text(_subtitle.toString()),
        onLongPress: () {
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
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('标题'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('甄嬛点我点到点我')],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('好的'),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/moiveitem');
                    },
                  )
                ],
              );
            });
      },
    );
  }
}

class NewMoive extends StatefulWidget {
  NewMoive({Key key}) : super(key: key);

  _NewMoiveState createState() => _NewMoiveState();
}

class _NewMoiveState extends State<NewMoive> with AutomaticKeepAliveClientMixin{
  // 保持页面状态需要继承一下AutomaticKeepAliveClientMixin然后设置一下wantKeepAlive
  @override
  bool get wantKeepAlive =>true;


  List<Widget> listDataM = new List();
  @override
  void initState() {
    getListData().then((val) {
      List<Widget> _listMoiveDate = new List();
      for (var i = 0; i < val['subjects'].length; i++) {
        Map _itemData = val['subjects'][i];
        _listMoiveDate.add(
          ContainerTabs(_itemData['images']['large'], _itemData['title'],
              _itemData['genres']),
        );
        _listMoiveDate.add(
          SizedBox(
            height: 5,
          ),
        );
      }
      setState(() {
        listDataM = _listMoiveDate;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listDataM,
    );
  }
}
