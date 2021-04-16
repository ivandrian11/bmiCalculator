import 'dart:math';
import 'package:flutter/material.dart';

class BMIBrain {
  final int height;
  final int weight;
  double _bmi;

  BMIBrain({this.height, this.weight});

  Color getColor() {
    if (_bmi >= 25.0)
      return Colors.yellow[600];
    else if (_bmi >= 18.0)
      return Colors.green[600];
    else
      return Colors.red[600];
  }

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double getPercentage() {
    if (_bmi > 40.0)
      return 1.0;
    else {
      return _bmi / 40.0;
    }
  }

  String getResult() {
    if (_bmi >= 25.0)
      return 'Overweight';
    else if (_bmi >= 18.0)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25.0)
      return 'You have a higher than normal body weight. Try to exercise more!';
    else if (_bmi >= 18.0)
      return 'You have a normal body weight. Good job!';
    else
      return 'You have a lower than normal body weight. You can eat a bit more!';
  }
}
