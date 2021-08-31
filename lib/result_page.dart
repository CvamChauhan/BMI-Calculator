import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:bmi_calculator/calculation_brain.dart';

CalculatorBrain? results;

class ResultPage extends StatelessWidget {
  ResultPage(CalculatorBrain myResult) {
    results = myResult;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: Colors.black,
              wordSpacing: 4,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ResultBody(),
    );
  }
}

class ResultBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your Result",
          style: TextStyle(
              fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: MyContainer(
            color: Colors.green,
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  results!.getResult(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  results!.calculateBMI(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  results!.getInterpretation(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 4),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "RE-CALCULATE",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        )
      ],
    );
  }
}

class MyIcon extends StatelessWidget {
  final IconData? icon;
  final String? iconName;
  MyIcon({@required this.icon, @required this.iconName});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 120,
        ),
        Text(
          "$iconName",
          style: kTextStyle,
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color? color;
  final Widget? myChild;
  MyContainer({this.color, this.myChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: myChild,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class SquareIconButton extends StatelessWidget {
  final IconData? icon;
  final onTap;
  SquareIconButton({@required this.icon, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.yellow,
      ),
      onPressed: onTap,
      fillColor: Colors.black,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(),
    );
  }
}
