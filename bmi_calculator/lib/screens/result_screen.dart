import 'package:bmi_calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class ResultScreen extends StatelessWidget {
  double height;
  int weight;
  int age;

  double calculation() {
    double result = weight / pow(height / 100, 2);
    return result;
  }

  List<Object> rating() {
    List<Object> ratings = [];
    double bmi = calculation();
    String ratingText = '';
    String comment = '';
    Color color = Colors.white;
    if (bmi < 18.5) {
      ratingText = 'Underweight';
      comment = 'U seem to be underweight, try to eat more';
      color = Colors.grey;
    } else if (18.5 < bmi && bmi <= 24.9) {
      ratingText = 'Normal';
      comment = 'U seem to be normal, good job, keep going';
      color = Colors.green;
    } else if (25.0 < bmi && bmi <= 29.9) {
      ratingText = 'Overweight';
      comment = 'U seem to be overweight, start working out';
      color = Colors.yellow;
    } else if (bmi >= 30.0) {
      ratingText = 'Obese';
      comment = ' Obese, eat more healthy and workout';
      color = Colors.red;
    }

    ratings = [ratingText, comment, color];
    return ratings;
  }

  ResultScreen(
    this.height,
    this.weight,
    this.age,
  );
  static const routeName = 'route';
  @override
  Widget build(BuildContext context) {
    List<Object> ratings = rating();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 11, 34, 1.0),
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Result',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    '${ratings[0]}',
                    style: TextStyle(
                        color: ratings[2] as Color,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        calculation().toStringAsFixed(1),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(
                    '${ratings[1]}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                height: 80,
                minWidth: 350,
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorScreen()),
                  );
                },
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
