import 'package:bmi_calc/common/config.dart';
import 'package:bmi_calc/common/size_config.dart';
import 'package:bmi_calc/model/bmi_brain.dart';
import 'package:bmi_calc/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatelessWidget {
  static String routeName = 'result';
  final BMIBrain bmiBrain;

  ResultPage({@required this.bmiBrain});

  @override
  Widget build(BuildContext context) {
    final String bmiResults = bmiBrain.calculateBMI();
    final double percentage = bmiBrain.getPercentage();
    final String labelResults = bmiBrain.getResult();
    final String interpretation = bmiBrain.getInterpretation();
    final Color color = bmiBrain.getColor();

    AppBar appBar = AppBar(
      centerTitle: true,
      title: Text('BMI Results'),
    );

    Widget percentageResult = CircularPercentIndicator(
      radius: (SizeConfig.safeBlockVertical * 32.52).roundToDouble(),
      lineWidth: (SizeConfig.safeBlockHorizontal * 6.1).roundToDouble(),
      animation: true,
      percent: percentage,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
      header: Padding(
        padding: EdgeInsets.symmetric(
          vertical: (SizeConfig.safeBlockVertical * 2.27).roundToDouble(),
        ),
        child: Text(
          labelResults,
          style: TextStyle(
            fontSize: (SizeConfig.safeBlockHorizontal * 5.56).roundToDouble(),
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
      center: Text(
        bmiResults,
        style: numberTextStyle,
      ),
      footer: Padding(
        padding: EdgeInsets.symmetric(
          vertical: (SizeConfig.safeBlockVertical * 2.27).roundToDouble(),
          horizontal: (SizeConfig.safeBlockHorizontal * 3.3).roundToDouble(),
        ),
        child: Text(
          interpretation,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: (SizeConfig.safeBlockHorizontal * 4.72).roundToDouble(),
          ),
        ),
      ),
    );

    Widget buttonCard = ReusableCard(
      onPressed: () => Navigator.of(context).pop(),
      color: fillColor,
      child: Center(
        child: Text(
          'Try Again',
          style: bottomTextStyle,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Expanded(flex: 6, child: percentageResult),
          Expanded(child: buttonCard),
        ],
      ),
    );
  }
}
