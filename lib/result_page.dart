import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbi_calculator2/calculator.dart';
import 'package:mbi_calculator2/widgets/bottom_button.dart';
import 'package:mbi_calculator2/widgets/containers.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;

  const ResultPage({
    Key key,
    this.height,
    this.weight,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  BMICalculator calculator;

  @override
  void initState() {
    super.initState();
    calculator = BMICalculator(
      height: widget.height,
      weight: widget.weight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(15),
              left: ScreenUtil().setHeight(10),
            ),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MyContainer(
            content: resultPageContent(),
          ),
          BottomButton(
            height: ScreenUtil().setHeight(80),
            text: 'RE-CALCULATE',
            color: Colors.pink,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )),
    );
  }

  Widget resultPageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              '${calculator.getResultState()}',
              style: TextStyle(
                color: setStateColor(
                  '${calculator.getResultState()}',
                ),
                fontSize: ScreenUtil().setSp(
                  20,
                  allowFontScalingSelf: true,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              '${calculator.calculateBMI().toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(
                  85,
                  allowFontScalingSelf: true,
                ),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Normal BMI range:',
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: ScreenUtil().setSp(
                      20,
                      allowFontScalingSelf: true,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: '\n18,8 - 25 kg/m2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${calculator.getRecommendation()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(
                  20,
                  allowFontScalingSelf: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color setStateColor(String state) {
    if (state == 'NORMAL') {
      return Colors.green;
    } else if (state == 'OVERWEIGHT') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
