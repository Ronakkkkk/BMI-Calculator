import 'package:bmi_calculator/custom_card.dart';
import 'package:flutter/material.dart';
import 'bottombutton.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resulttext;
  final String interpretation;
  ResultsPage(
      {@required this.bmiResult,
      @required this.resulttext,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Customcard(
              colour: kactivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xff24d876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE BMI',
            onpressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
