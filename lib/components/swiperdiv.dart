import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// 轮播组件
class SwiperDiv extends StatelessWidget {

  final List showSwipData;
  SwiperDiv({this.showSwipData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 250,
      color: Colors.white,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${showSwipData[index]['images']['large']}",
          );
        },
        itemCount: showSwipData.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemWidth: 200.0,
        itemHeight: 400.0,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}