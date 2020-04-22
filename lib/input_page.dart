import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calcutale_brain.dart';

enum Gender { Female, Male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      switchGender: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      colour: selectedGender == Gender.Male
                          ? kBoxColor
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          label: "Male", myIcon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      switchGender: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      colour: selectedGender == Gender.Female
                          ? kBoxColor
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          label: "Female", myIcon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kHeightStyle),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kBottomBoxColor,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: kBottomBoxColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24),
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kBoxColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeightStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                icon: FontAwesomeIcons.minus,
                                updateInfo: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                updateInfo: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kBoxColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kHeightStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                  icon: FontAwesomeIcons.minus,
                                  updateInfo: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                updateInfo: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(onPress: () {
              CalculateBrain cal = new CalculateBrain(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    result: cal.getResult(),
                    bmi: cal.getBMI(),
                    interpretation: cal.getInterpretation(),
                  )));
            },
            cal: 'CALCULATE',)
          ],
        ));
  }
}



class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.icon, @required this.updateInfo});

  final IconData icon;
  final Function updateInfo;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: updateInfo,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
