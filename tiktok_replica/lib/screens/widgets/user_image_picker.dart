import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);
  final void Function(XFile pickedImage) imagePickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  void _pickImage() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = image;
    });

    var userId = FirebaseAuth.instance.currentUser!.uid;
    widget.imagePickFn(_pickedImage!);
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(userId + '.jpg');

    await ref.putFile(File(image!.path));
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'imageUrl': url,
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Change Image'),
        ),
      ],
    );
  }
}
