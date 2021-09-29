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
  double _currentSliderValue = 20;
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
            child: Row(
              children: [
                SizedBox(
                  width: 350,
                  child: Card(
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 250,
                      divisions: 250,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Card(
                  child: Text('Weight'),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Card(
                  child: Text('Age'),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                height: 60,
                minWidth: 350,
                color: Theme.of(context).accentColor,
                onPressed: () => {Navigator.of(context).pushNamed('route')},
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
