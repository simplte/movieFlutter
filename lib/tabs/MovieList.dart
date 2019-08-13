import 'package:flutter/material.dart';
import '../listPage/newMoive.dart';

class MoiveList extends StatefulWidget {
  MoiveList({Key key}) : super(key: key);

  _MoiveListState createState() => _MoiveListState();
}

class _MoiveListState extends State<MoiveList> {
  String _imgUrl =
      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp';
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        NewMoive(),
        NewMoive(),
        NewMoive(),
        DefaultTabController(
          length: 4,
          child: 
            Scaffold(
              appBar: ChildAppBar(),
              body: SecondTab(),
        )
        ,)
      ],
    );
  }
}
class SecondTab extends StatelessWidget {
  const SecondTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        NewMoive(),
        NewMoive(),
       NewMoive(),
        NewMoive(),
      ],
    );
  }
}

class ChildAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ChildAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         bottom: TabBar(
           indicatorWeight:4,
           labelColor: Colors.black,
           tabs: <Widget>[
             Tab(text: '最新',),
             Tab(text: '推荐',),

             Tab(text: '经典',),

             Tab(text: '好评',),
           ],
         ),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();
  Size getSize(){
    return new Size(100.0, 50.0);
  }
}