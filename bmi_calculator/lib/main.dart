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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CalculatorScreen();
  }
}
