import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 11, 34, 1.0),
      appBar: AppBar(
        leading: Icon(Icons.calculate),
        title: Text(
          'B.M.I CALCULATOR',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Male ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Female ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Height',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Number',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Number',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => {},
                child: Text(
                  '-',
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text(
                  '-',
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text('+'),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('CALCULATE'),
            ),
          )
        ],
      ),
    );
  }
}
