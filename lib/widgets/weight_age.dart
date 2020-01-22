import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightAge extends StatefulWidget {
  final String widgetType;
  final int min;
  final int max;
  final ValueChanged<int> onChange;

  const WeightAge({
    Key key,
    @required this.widgetType,
    @required this.min,
    @required this.max,
    this.onChange,
  }) : super(key: key);

  @override
  _WeightAgeState createState() => _WeightAgeState();
}

class _WeightAgeState extends State<WeightAge> {
  int value;

  @override
  void initState() {
    super.initState();
    if (widget.widgetType == 'AGE') {
      value = 22;
    } else {
      value = 60;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '${widget.widgetType}',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(
              18,
              allowFontScalingSelf: true,
            ),
            color: Colors.white24,
          ),
        ),
        RichText(
          text: TextSpan(
            text: '${value}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                38,
                allowFontScalingSelf: true,
              ),
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: widget.widgetType == 'AGE' ? null : ' kg',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    11,
                    allowFontScalingSelf: true,
                  ),
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            circleCounter(
              icon: Icons.add,
              onTap: incrementValue,
            ),
            circleCounter(
              icon: Icons.remove,
              onTap: decrementValue,
            ),
          ],
        )
      ],
    );
  }

  Widget circleCounter({icon, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setHeight(8),
          vertical: ScreenUtil().setHeight(3),
        ),
        width: ScreenUtil().setWidth(40),
        height: ScreenUtil().setHeight(40),
        decoration: BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon)),
      ),
    );
  }

  void incrementValue() {
    ++value;
    if (widget.widgetType == 'AGE') {
      if (value > widget.max) {
        value = widget.max;
      }
    } else {
      if (value > widget.max) {
        value = widget.max;
      }
    }
    widget.onChange(value);
    setState(() {});
  }

  void decrementValue() {
    --value;
    if (widget.widgetType == 'AGE') {
      if (value < widget.min) {
        value = widget.min;
      }
    } else {
      if (value < widget.min) {
        value = widget.min;
      }
    }
    widget.onChange(value);
    setState(() {});
  }
}
