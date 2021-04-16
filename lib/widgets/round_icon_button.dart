import 'package:bmi_calc/common/config.dart';
import 'package:bmi_calc/common/size_config.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 8,
      shape: CircleBorder(),
      fillColor: inactiveTextColor,
      constraints: BoxConstraints.tightFor(
        width: (SizeConfig.safeBlockHorizontal * 12.78).roundToDouble(),
        height: (SizeConfig.safeBlockVertical * 7.48).roundToDouble(),
      ),
    );
  }
}
