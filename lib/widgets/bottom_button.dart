import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  final double height;
  final String text;
  final Color color;
  final Function onTap;

  const BottomButton({
    Key key,
    @required this.height,
    @required this.text,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(height),
        color: color,
        child: Center(
          child: Text(
            '$text'.toUpperCase(),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                20,
                allowFontScalingSelf: true,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
