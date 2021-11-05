import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';


const kBottomContainerHeight = 80.0;
const kBottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender) {
    //male card pressed
    if(gender == 1) {
      if(maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }

    //female card pressed
    if(gender == 2) {
      if(femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
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
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ResusableCard(
                      cardChild: IconsContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                      theColor: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ResusableCard(
                      cardChild: IconsContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                      theColor: femaleCardColor,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ResusableCard(
                cardChild: Container(),
                theColor: Color(0xFF1D1E33),
              ),
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: ResusableCard(
                    cardChild: Container(),
                    theColor: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ResusableCard(
                    cardChild: Container(),
                    theColor: Color(0xFF1D1E33),
                  ),
                ),
              ],
            )),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        )
    );
  }
}
