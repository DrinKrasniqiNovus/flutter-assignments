import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import './screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(17, 20, 40, 1.0),
        accentColor: const Color.fromRGBO(235, 21, 85, 1.0),
        backgroundColor: const Color.fromRGBO(10, 11, 34, 1.0),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CalculatorScreen();
  }
}
