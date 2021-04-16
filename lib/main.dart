import 'package:bmi_calc/common/config.dart';
import 'package:bmi_calc/ui/result_page.dart';
import 'package:bmi_calc/ui/selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: fillColor,
          inactiveTrackColor: inactiveTextColor,
          thumbColor: Colors.white,
          overlayColor: Color(0x1fFFFFFF),
        ),
      ),
      initialRoute: SelectorPage.routeName,
      routes: {
        SelectorPage.routeName: (context) => SelectorPage(),
        ResultPage.routeName: (context) =>
            ResultPage(bmiBrain: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
