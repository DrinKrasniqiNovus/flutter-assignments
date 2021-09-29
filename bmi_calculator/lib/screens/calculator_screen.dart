import 'package:flutter/material.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Card(
                  child: FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: [Icon(Icons.male), Text('Male')],
                      )),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Card(
                  child: FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: [Icon(Icons.female), Text('Female')],
                      )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 350,
                child: Card(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 5,
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
                onPressed: () => {},
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
