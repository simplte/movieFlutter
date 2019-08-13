import 'package:flutter/material.dart';
import '../listPage/newMoive.dart';

class MoiveList extends StatefulWidget {
  MoiveList({Key key}) : super(key: key);

  _MoiveListState createState() => _MoiveListState();
}

class _MoiveListState extends State<MoiveList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String _imgUrl =
      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp';
  TabController _tabController;
  ScrollController _scrollViewController;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        NewMoive(),
        NewMoive(),
        NewMoive(),
        NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
                  floating:
                      true, //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
                  snap:
                      false, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
                  expandedHeight: 280, //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
                  flexibleSpace: FlexibleSpaceBar(
                    //tab以上的内容，滑动向上的
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      //头部整个背景颜色
                      height: double.infinity,
                      color: Colors.red,
                      child: Container(
                        color: Colors.grey,
                      )
                    ),
                  ),
                  bottom: TabBar(controller: _tabController, tabs: [
                    Tab(text: "aaa"),
                    Tab(text: "bbb"),
                    Tab(text: "ccc"),
                  ]),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              NewMoive(),
              NewMoive(),
              NewMoive(),
            ]))
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

class ChildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChildAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      bottom: TabBar(
        indicatorWeight: 4,
        labelColor: Colors.black,
        tabs: <Widget>[
          Tab(
            text: '最新',
          ),
          Tab(
            text: '推荐',
          ),
          Tab(
            text: '经典',
          ),
          Tab(
            text: '好评',
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();
  Size getSize() {
    return new Size(100.0, 50.0);
  }
}
