import 'package:bmi_calc/common/size_config.dart';
import 'package:flutter/material.dart';

const fillColor = Color(0xFFEB1555);
const backgroundColor = Color(0xFF0A0D22);
const inactiveTextColor = Color(0xFF898A95);
const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1F33);

TextStyle factorTextStryle = TextStyle(
  fontSize: (SizeConfig.safeBlockHorizontal * 5).roundToDouble(),
  fontWeight: FontWeight.bold,
  color: inactiveTextColor,
);

TextStyle numberTextStyle = TextStyle(
  fontSize: (SizeConfig.safeBlockHorizontal * 13.9).roundToDouble(),
  fontWeight: FontWeight.w900,
);

TextStyle bottomTextStyle = TextStyle(
  fontSize: (SizeConfig.safeBlockHorizontal * 5).roundToDouble(),
  fontWeight: FontWeight.bold,
);
