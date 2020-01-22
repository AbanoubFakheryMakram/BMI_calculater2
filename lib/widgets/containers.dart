import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget content;

  const MyContainer({Key key, this.color, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
        decoration: BoxDecoration(
          color: color ?? Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
