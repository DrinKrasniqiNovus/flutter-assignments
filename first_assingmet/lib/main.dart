import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _emailUrl() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'drin.krasniqi@novus.consulting',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
            ListTile(
              title: Text(
                'Drin Krasniqi',
                textAlign: TextAlign.center,
                style: GoogleFonts.kavoon(fontSize: 35, color: Colors.white),
              ),
              subtitle: Text(
                'Flutter App Developer',
                textAlign: TextAlign.center,
                style: GoogleFonts.novaFlat(fontSize: 18, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: const Divider(
                height: 1,
                thickness: 1,
                indent: 125,
                endIndent: 125,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              width: 260,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 24.0,
                ),
                label: Text(
                  '+ 383 49 117 722',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                onPressed: () => launch("tel://+38349117722"),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              width: 260,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 24.0,
                ),
                label: Text(
                  'drin.krasniqi@novus.consulting',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                onPressed: _emailUrl,
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
