import 'package:flutter/material.dart';
import '../screens/result_screen.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
    @required double currentSliderValue,
    @required this.weight,
    @required this.age,
  })  : _currentSliderValue = currentSliderValue,
        super(key: key);

  final double _currentSliderValue;
  final int weight;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: MaterialButton(
          height: 80,
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
    );
  }
}
