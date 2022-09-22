import 'package:flutter/material.dart';
import 'bottombutton.dart';
import 'results.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_card.dart';
import 'icons.dart';
import 'bmi_brain.dart';

enum Gender {
  male,
  female,
}
int height = 180;
int weight = 60;
int age = 19;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Customcard(
                      onpress: () {
                        setState(() {
                          selectgender = Gender.male;
                        });
                      },
                      colour: selectgender == Gender.male
                          ? kactivecardcolor
                          : kinactivecolor,
                      cardchild:
                          Customicon(icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: Customcard(
                      onpress: () {
                        setState(() {
                          selectgender = Gender.female;
                        });
                      },
                      colour: selectgender == Gender.female
                          ? kactivecardcolor
                          : kinactivecolor,
                      cardchild: Customicon(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Customcard(
                      colour: kactivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: ksmalltextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kbigtextstyle,
                              ),
                              Text(
                                'cm',
                                style: ksmalltextstyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8B98),
                              overlayColor: Color(0x29EB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                max: 220,
                                min: 120,
                                onChanged: (double newvalue) {
                                  setState(() {
                                    height = newvalue.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Customcard(
                      colour: kactivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: ksmalltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kbigtextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Customcard(
                      colour: kactivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: ksmalltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kbigtextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onpressed: () {
                BmiBrain calc = BmiBrain(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculatebmi(),
                      resulttext: calc.getresult(),
                      interpretation: calc.getinterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;

  RoundButton({this.icon, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5e),
    );
  }
}
