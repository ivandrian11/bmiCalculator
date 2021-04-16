import 'package:bmi_calc/common/config.dart';
import 'package:bmi_calc/common/size_config.dart';
import 'package:bmi_calc/model/bmi_brain.dart';
import 'package:bmi_calc/ui/result_page.dart';
import 'package:bmi_calc/widgets/gender_content.dart';
import 'package:bmi_calc/widgets/reusable_card.dart';
import 'package:bmi_calc/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class SelectorPage extends StatefulWidget {
  static String routeName = 'selector';

  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppBar appBar = AppBar(
      centerTitle: true,
      title: Text('BMI Calculator'),
    );

    Widget genderCard = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            onPressed: () => setState(() => selectedGender = Gender.male),
            color: selectedGender == Gender.male
                ? activeCardColor
                : inactiveCardColor,
            child: GenderContent(
              label: 'MALE',
              color: selectedGender == Gender.male
                  ? Colors.white
                  : inactiveTextColor,
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPressed: () => setState(() => selectedGender = Gender.female),
            color: selectedGender == Gender.female
                ? activeCardColor
                : inactiveCardColor,
            child: GenderContent(
              label: 'FEMALE',
              color: selectedGender == Gender.female
                  ? Colors.white
                  : inactiveTextColor,
            ),
          ),
        ),
      ],
    );

    Widget heightCard = ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'HEIGHT',
            style: factorTextStryle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text('$height', style: numberTextStyle),
              Text('cm', style: factorTextStryle),
            ],
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Slider(
              value: height.toDouble(),
              min: 120,
              max: 240,
              onChanged: (double newValue) {
                height = newValue.round();
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );

    Widget weightCard = ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('WEIGHT', style: factorTextStryle),
          Text('$weight', style: numberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () => setState(() => weight--),
              ),
              SizedBox(
                width: (SizeConfig.safeBlockHorizontal * 2.78).roundToDouble(),
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () => setState(() => weight++),
              ),
            ],
          ),
        ],
      ),
    );

    Widget ageCard = ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('AGE', style: factorTextStryle),
          Text('$age', style: numberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () => setState(() => age--),
              ),
              SizedBox(
                width: (SizeConfig.safeBlockHorizontal * 2.78).roundToDouble(),
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () => setState(() => age++),
              ),
            ],
          ),
        ],
      ),
    );

    Widget buttonCard = ReusableCard(
      onPressed: () {
        Navigator.of(context).pushNamed(
          ResultPage.routeName,
          arguments: BMIBrain(height: height, weight: weight),
        );
      },
      color: fillColor,
      child: Center(
        child: Text(
          'Let\'s Begin',
          style: bottomTextStyle,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Expanded(child: genderCard),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: heightCard),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: weightCard),
                      Expanded(child: ageCard),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: buttonCard),
        ],
      ),
    );
  }
}
