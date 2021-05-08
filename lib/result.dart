import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String bmiMessage;

  const Result({this.bmiResult, this.bmiText, this.bmiMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 46.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText.toUpperCase(),
                    style: TextStyle(
                        color: Colors.green.shade300,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 52.0,
                    ),
                  ),
                  Text(
                    bmiMessage,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
                Navigator.pop(context);
              },
              child: Text(
                "RE-CALCULATE",
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
