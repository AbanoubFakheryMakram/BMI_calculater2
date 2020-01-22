import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbi_calculator2/gender/gender_card.dart';
import 'package:mbi_calculator2/height/height.dart';
import 'package:mbi_calculator2/widgets/bottom_button.dart';
import 'package:mbi_calculator2/widgets/containers.dart';
import 'package:mbi_calculator2/result_page.dart';
import 'package:mbi_calculator2/widgets/weight_age.dart';
import 'package:rect_getter/rect_getter.dart';

import 'fade_transition.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  bool isFemale = false;
  int userHeight = 110;
  int userWeight = 60;
  int userYears = 20;

  var globalKey = RectGetter.createGlobalKey();
  Rect rect;

  // The ripple animation time (1 second)
  Duration animationDuration = Duration(milliseconds: 800);
  Duration delayTime = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      allowFontScaling: true,
    );

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('BMI Calculator'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    MyContainer(
                      content: GenderCard(
                        onTap: () {
                          setState(() {
                            isFemale = true;
                            isMale = false;
                          });
                        },
                        isSelected: isFemale,
                        icon: Icon(
                          CommunityMaterialIcons.gender_female,
                          color: isFemale ? Colors.white : Colors.white24,
                          size: ScreenUtil().setSp(
                            60,
                            allowFontScalingSelf: true,
                          ),
                        ),
                        type: 'FEMALE',
                      ),
                    ),
                    MyContainer(
                      content: GenderCard(
                        isSelected: isMale,
                        onTap: () {
                          setState(() {
                            isMale = true;
                            isFemale = false;
                          });
                        },
                        icon: Icon(
                          CommunityMaterialIcons.gender_male,
                          size: ScreenUtil().setSp(
                            60,
                            allowFontScalingSelf: true,
                          ),
                          color: isMale ? Colors.white : Colors.white24,
                        ),
                        type: 'MALE',
                      ),
                    ),
                  ],
                ),
              ),
              MyContainer(
                content: Height(
                  onSliderChange: (value) {
                    setState(() {
                      userHeight = value.toInt();
                    });
                  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyContainer(
                      content: WeightAge(
                        widgetType: 'WEIGHT',
                        min: 40,
                        onChange: (value) {
                          setState(() {
                            userWeight = value;
                          });
                        },
                        max: 145,
                      ),
                    ),
                    MyContainer(
                      content: WeightAge(
                        widgetType: 'AGE',
                        min: 18,
                        onChange: (value) {
                          setState(() {
                            userYears = value;
                          });
                        },
                        max: 65,
                      ),
                    ),
                  ],
                ),
              ),
              RectGetter(
                key: globalKey,
                child: BottomButton(
                  onTap: _onTap,
                  color: Colors.pink,
                  height: ScreenUtil().setHeight(80),
                  text: 'Calculate',
                ),
              ),
            ],
          ),
        ),
        _ripple(),
      ],
    );
  }

  // create ripple widget
  Widget _ripple() {
    if (rect == null) {
      return Container();
    }

    // has the same position of fab and its shape
    // use AnimatedPosition to transition from a small dot to blue screen go smoothly
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle, // the shape of the ripple
          color: Colors.pink, // the color of the overlay
        ),
      ),
    );
  }

  void _onTap() {
    // => set rect to be size of fab  (widget)
    setState(() => rect = RectGetter.getRectFromKey(globalKey));

    /*
        we cannot change the size of ripple after we set it to the original one (covering the fab).
        We need to delay it a bit, to be more specific,
        we just need a one frame delay. That’s why we will use WidgetsBinding.postFrameCallback.
         */

    // Make delay for one frame to expand the size of the ripple
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // => expand the ripple size to the logest side * 1.3 to covering whole screen
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      // => after delay, go to next page
      Future.delayed(animationDuration + delayTime, goToNextPage);
    });
  }

  void goToNextPage() {
    Navigator.of(context)
        .push(
          FadeRouteBuilder(
            page: ResultPage(
              height: userHeight,
              weight: userWeight,
            ),
          ),
        )
        .then(
          (_) => setState(() => rect = null),
        );
  }
}
