import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TikTokStyleFullPageScroller(
        contentSize: colors.length,
        swipePositionThreshold: 0.2,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        // ^ how long the animation will take
        onScrollEvent: _handleCallbackEvent,
        // ^ registering our own function to listen to page changes
        builder: (BuildContext context, int index) {
          return Container(
            color: colors[index],
            child: Center(
              child: Text(
                '$index',
                key: Key('$index-text'),
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleCallbackEvent(ScrollEventType type, {int? currentIndex}) {
    print(
        "Scroll callback received with data: {type: $type, and index: ${currentIndex ?? 'not given'}}");
  }
}
