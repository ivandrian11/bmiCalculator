import 'package:bmi_calc/common/size_config.dart';
import 'package:flutter/material.dart';

class GenderContent extends StatelessWidget {
  final String label;
  final Color color;

  GenderContent({
    @required this.color,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: (SizeConfig.safeBlockHorizontal * 4.4).roundToDouble(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
