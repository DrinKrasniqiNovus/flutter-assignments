import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

enum Sex {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int weight = 60;
  int age = 20;
  double _currentSliderValue = 120;
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Expanded(
                    child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            '$_currentSliderValue cm',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Slider(
                          activeColor: Theme.of(context).accentColor,
                          value: _currentSliderValue,
                          min: 120,
                          max: 250,
                          divisions: 130,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: 400,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(Icons.remove_circle),
                                    color: Colors.grey,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                height: 60,
                minWidth: 350,
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        _currentSliderValue,
                        weight,
                        age,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Calculate',
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
