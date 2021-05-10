import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reUsablecard.dart';
import 'iconsData.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColour;
  Color femaleColour;
  Color activeColour = Color(0xFF1D1E33);
  Color inactiveColour = Color(0xFF111328);
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
                        name: 'Male',
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
                          name: 'Female', icn: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 80.0,
          //   width: double.infinity,
          //   color: Color(0xFFEB1555),
          //   margin:
          //       EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
          // )
        ],
      ),
    );
  }
}
