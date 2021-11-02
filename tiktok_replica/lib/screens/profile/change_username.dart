import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({Key? key}) : super(key: key);

  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  void update() {
    final user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(user?.uid)
        .update({'userName': username.trim()}) // <-- Updated data
        .then((_) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('U changed your Username'),
                ),
              ),
              Navigator.pop(context)
            })
        .catchError((error) => print('Failed: $error'));
  }

  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Username'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: (value) {
                username = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Username',
              ),
            ),
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  child: Text('Save Username')))
        ],
      ),
    );
  }
}
