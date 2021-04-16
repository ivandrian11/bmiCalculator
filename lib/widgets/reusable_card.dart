import 'package:bmi_calc/common/config.dart';
import 'package:bmi_calc/common/size_config.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color color;

  ReusableCard({
    @required this.child,
    this.onPressed,
    this.color = activeCardColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: (SizeConfig.safeBlockHorizontal * 3.3).roundToDouble(),
          vertical: (SizeConfig.safeBlockVertical * 1.95).roundToDouble(),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
