import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker2 extends StatefulWidget {
  UserImagePicker2(this.imagePickFn);
  final void Function(File pickedImage) imagePickFn;
  @override
  _UserImagePicker2State createState() => _UserImagePicker2State();
}

class _UserImagePicker2State extends State<UserImagePicker2> {
  File _pickedImage;
  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 100,
    );
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonTheme(
          minWidth: 10,
          child: FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text(''),
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
      ],
    );
  }
}
