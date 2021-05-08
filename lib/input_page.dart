import 'result.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_column.dart';
import 'constants.dart';
import 'bmi_calculator.dart';

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Genders selectedGender;
  int height = 165, weight = 60, age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableColumn(
                      text: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      color: selectedGender == Genders.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableColumn(
                        text: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: textStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  weight--;
                                }),
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  weight++;
                                }),
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  age--;
                                }),
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  age++;
                                }),
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            height: kBottomContainerHeight,
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            margin: EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmiResult: calc.calculateBMI(),
                      bmiMessage: calc.getMessage(),
                      bmiText: calc.getResult(),
                    ),
                  ),
                );
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const RoundIconButton({this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(
        this.iconData,
        color: Colors.white,
      ),
    );
  }
}
