import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reUsablecard.dart';
import 'iconsData.dart';
import 'resultPage.dart';
import 'caluclate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColour;
  Color femaleColour;
  Color activeColour = Color(0xFF1D1E33);
  Color inactiveColour = Color(0xFF111328);
  int height = 180;
  int weight = 50;
  int age = 15;
  @override
  void initState() {
    super.initState();
    maleColour = inactiveColour;
    femaleColour = inactiveColour;
  }

  changeColour(int id) {
    if (id == 0) {
      if (maleColour == inactiveColour) {
        setState(() {
          if (id == 0) {
            if (maleColour == inactiveColour) {
              maleColour = activeColour;
              femaleColour = inactiveColour;
            } else {
              setState(() {
                maleColour = inactiveColour;
              });
            }
          }
        });
      }
    } else if (id == 1) {
      if (femaleColour == inactiveColour) {
        setState(() {
          femaleColour = activeColour;
          maleColour = inactiveColour;
        });
      } else {
        setState(() {
          femaleColour = inactiveColour;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: [
          FlatButton(
            onPressed: () {
              BmiCaluclator calc =
                  BmiCaluclator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultpage(
                    bmiResult: calc.CaluclateBmi(),
                    interpretation: calc.getInterpretation(),
                    ResultText: calc.GetResult(),
                  ),
                ),
              );
            },
            child: Text(
              "Caluclate",
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: activeColour,
                    onTap: () {
                      this.changeColour(0);
                    },
                    child: ReusableCard(
                      color: maleColour,
                      cardChild: customWidget(
                        name: 'MALE',
                        icn: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: activeColour,
                    onTap: () {
                      this.changeColour(1);
                    },
                    child: ReusableCard(
                      color: femaleColour,
                      cardChild: customWidget(
                          name: 'FEMALE', icn: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
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
                    color: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
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
          // Container(
          //   child: GestureDetector(
          //     child: Text(
          //       "Caluclate your BMI",
          //       style: TextStyle(fontSize: 20.0, color: Colors.white),
          //     ),
          //     onPressed: () {
          //       BmiCaluclator calc =
          //           BmiCaluclator(height: height, weight: weight);
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => Resultpage(
          //                     bmiResult: calc.CaluclateBmi(),
          //                     interpretation: calc.getInterpretation(),
          //                     ResultText: calc.GetResult(),
          //                   )));
          //     },
          //   ),
          //   height: 80.0,
          //   width: double.infinity,
          //   color: Color(0xFFEB1555),
          //   margin:
          //       EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
          // ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
