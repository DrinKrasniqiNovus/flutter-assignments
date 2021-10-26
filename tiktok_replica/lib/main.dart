import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_replica/nav_bar.dart';
import 'package:tiktok_replica/screens/auth/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginScreen(),
    );
  }
}

// This trailing comma makes auto-formatting nicer for build methods.
    
  

