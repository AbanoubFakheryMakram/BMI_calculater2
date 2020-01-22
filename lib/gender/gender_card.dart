import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCard extends StatefulWidget {
  final bool isSelected;
  final icon;
  final String type;
  final Function onTap;

  const GenderCard({
    Key key,
    @required this.isSelected,
    @required this.icon,
    @required this.type,
    this.onTap,
  }) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.white24 : Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.icon,
            SizedBox(
              height: ScreenUtil().setHeight(8),
            ),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 500),
              child: Text('${widget.type}'),
              style: TextStyle(
                fontSize: 18,
                color: widget.isSelected ? Colors.white : Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
