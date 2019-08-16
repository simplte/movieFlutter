import 'package:flutter/material.dart';
import 'package:flutter_app/components/showTip.dart';
import 'package:oktoast/oktoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HotMoive extends StatelessWidget {
  const HotMoive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: InkWell(
        child: Text('data'),
        onTap: (){
          Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      )
    );
  }
}
