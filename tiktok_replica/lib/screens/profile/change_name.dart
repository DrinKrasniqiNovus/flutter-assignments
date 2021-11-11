import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  void update() {
    final user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('users');
    try {
      collection.doc(user?.uid).update({'name': name.trim()});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('U changed your name'),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
    collection
        .doc(user?.uid)
        .update({'name': name.trim()}) // <-- Updated data
        .then((_) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('U changed your name'),
                ),
              ),
              Navigator.pop(context),
              FocusScope.of(context).unfocus(),
            })
        .catchError((error) => print('Failed: $error'));
  }

  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Change name'),
      ),
      body: Container(
        height: 200,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      update();
                    },
                    child: Text('Save name')))
          ],
        ),
      ),
    );
  }
}
