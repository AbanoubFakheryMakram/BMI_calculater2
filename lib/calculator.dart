import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class BMICalculator {
  final int height, weight;

  double _bmi;

  BMICalculator({
    @required this.height,
    @required this.weight,
  });

  double calculateBMI({int height, int weight}) =>
      weight / _heightSquared(height);

  double calculateMinNormalWeight({int height}) =>
      18.5 * _heightSquared(height);

  double calculateMaxNormalWeight({int height}) => 25 * _heightSquared(height);

  double _heightSquared(int height) => math.pow(height / 100, 2);

  String getResultState() {
    calculateBMI();
    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'NORMAL';
    } else if (_bmi >= 24.9) {
      return 'OVERWEIGHT';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getRecommendation() {
    calculateBMI();
    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi >= 24.9) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
