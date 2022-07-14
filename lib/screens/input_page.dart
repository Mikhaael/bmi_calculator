import 'package:bmi_calculator/components/enums.dart';
import 'package:bmi_calculator/screens/bmi_result.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusuable_container.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

// const bottomContainerHeight = 80.0;
// const activeCardColor = Color(0xFF1D1E33);
// const bottomContainerColor = Color(0xFFEB1555);
// const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: genderWidget(),
            ),
            Expanded(
              child: ReusuableContainer(
                  cardChild: heightWidget(), color: kActiveCardColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusuableContainer(
                      color: kActiveCardColor,
                      cardChild: weightWidget(),
                    ),
                  ),
                  Expanded(
                    child: ReusuableContainer(
                        cardChild: ageWidget(), color: kActiveCardColor),
                  )
                ],
              ),
            ),
            bottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Resultpage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            ))));
              },
            ),
          ],
        ));
  }

  Widget genderWidget() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                updateColor(Gender.male);
                // selectedGender = Gender.male;
              });
            },
            child: ReusuableContainer(
                cardChild: const GenderWidget(
                  icon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
                color: maleCardColor),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                updateColor(Gender.female);
                // selectedGender = Gender.female;
              });
            },
            child: ReusuableContainer(
                cardChild: const GenderWidget(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
                color: femaleCardColor),
          ),
        )
      ],
    );
  }

  Widget heightWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Height',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(height.toString(), style: kNumberTextStyle),
            const Text(
              'cm',
              style: kLabelTextStyle,
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 250.0,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
        )
      ],
    );
  }

  Widget weightWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Weight',
          style: kLabelTextStyle,
        ),
        Text(weight.toString(), style: kNumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            roundedIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  weight--;
                });
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
            roundedIconButton(
              onPressed: () {
                setState(() {
                  weight++;
                });
              },
              icon: FontAwesomeIcons.plus,
            )
          ],
        )
      ],
    );
  }

  Widget ageWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Age',
          style: kLabelTextStyle,
        ),
        Text(
          age.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            roundedIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  setState(() {
                    age--;
                  });
                }),
            const SizedBox(
              width: 10.0,
            ),
            roundedIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    age++;
                  });
                }),
          ],
        )
      ],
    );
  }
}
