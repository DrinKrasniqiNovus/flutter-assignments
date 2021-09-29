import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = 'route';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 11, 34, 1.0),
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Your Result',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
