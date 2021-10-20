import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/widgets/pickers/user_image_picker2.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  File _image;
  var _enteredMessage = '';
  void _pickedImage(File image) {
    _image = image;
  }

  Future<bool> isGoogle() async {
    final userGoogle = await FirebaseAuth.instance.currentUser();
    return userGoogle.providerData[0].providerId == 'google.com';
  }

  void _sendMessage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('sent_image')
        .child(Timestamp.now().toString() + '.jpg');

    await ref.putFile(_image).onComplete;
    final url = await ref.getDownloadURL();

    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();

    if (user.isEmailVerified) {
      print('i am in google');
      Firestore.instance.collection('chat').add({
        'image': url,
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username': user.displayName,
        'userImage': user.photoUrl,
      });
    } else {
      final userData =
          await Firestore.instance.collection('users').document(user.uid).get();
      Firestore.instance.collection('chat').add({
        'image': url,
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username': userData['username'],
        'userImage': userData['image_url'],
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          UserImagePicker2(_pickedImage),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: _enteredMessage.trim().isEmpty && _pickedImage == null
                ? null
                : _sendMessage,
          ),
        ],
      ),
    );
  }
}