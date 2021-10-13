import 'package:flutter/material.dart';
import '../screens/calculator_screen.dart';

class ReCalculateButton extends StatelessWidget {
  const ReCalculateButton({
    Key key,
  }) : super(key: key);

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
              MaterialPageRoute(builder: (context) => CalculatorScreen()),
            );
          },
          child: Text(
            'Re-Calculate',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
