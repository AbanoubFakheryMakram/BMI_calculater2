import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Height extends StatefulWidget {
  final ValueChanged<double> onSliderChange;
  final double min, max;

  const Height({
    Key key,
    this.onSliderChange,
    this.min = 100,
    this.max = 220,
  }) : super(key: key);

  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  double userHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(5),
          ),
          child: Text(
            "HEIGHT",
            style: TextStyle(
              color: Colors.white24,
              fontSize: 18,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: '${userHeight.toInt()}',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: ' cm',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Colors.pink,
            inactiveTrackColor: Colors.white24,
            thumbColor: Colors.pink,
            overlayColor: Colors.pink.withOpacity(0.5),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 13,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 23),
          ),
          child: Slider(
            value: userHeight,
            label: '$userHeight',
            min: widget.min,
            max: widget.max,
            onChanged: (value) {
              widget.onSliderChange(value);
              setState(() {
                userHeight = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
