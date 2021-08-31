import 'package:bmi_calculator/calculation_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }
Color activeColor = Color(0xAAFFD700);
Color inactiveColor = Color(0xFFFFD700);
Gender? selectedGender;
TextStyle kTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle kNumberStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
int height = 150, weight = 50, age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: Colors.yellowAccent,
              wordSpacing: 4,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: MyContainer(
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    myChild: MyIcon(
                      icon: Icons.male,
                      iconName: "MALE    ",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: MyContainer(
                    color: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    myChild: MyIcon(icon: Icons.female, iconName: "FEMALE"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: MyContainer(
              color: inactiveColor,
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                        trackHeight: 1,
                        thumbColor: Colors.red,
                        activeTrackColor: Colors.black,
                        overlayColor: Color(0x30EF5350)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                      // activeColor: Colors.black,
                      inactiveColor: Colors.black38,
                    ),
                  ),
                ],
              )),
        ),
        Expanded(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MyContainer(
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SquareIconButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SquareIconButton(
                            icon: Icons.minimize,
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  color: inactiveColor,
                ),
              ),
              Expanded(
                child: MyContainer(
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SquareIconButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SquareIconButton(
                            icon: Icons.minimize,
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  color: inactiveColor,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 4),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              CalculatorBrain myResult =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(myResult)));
            },
            child: Text(
              "CALCULATE",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ),
      ],
    );
  }
}
