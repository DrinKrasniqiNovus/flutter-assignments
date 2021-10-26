import 'package:flutter/material.dart';

class TabBarItems extends StatelessWidget {
  const TabBarItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // first tab bar view widget
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Your Videos',
              ),
            ),
          ),

          // second tab bar viiew widget
          Container(
            color: Colors.pink,
            child: Center(
              child: Text(
                'Favorites',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
