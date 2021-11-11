import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_replica/screens/getters/name.dart';
import 'package:tiktok_replica/screens/getters/profile_picture.dart';
import 'package:tiktok_replica/screens/widgets/user_image_picker.dart';
import 'package:tiktok_replica/screens/getters/username.dart';

import 'change_username.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  XFile? _userImageFile;
  void _pickedImage(XFile image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          UserImagePicker(_pickedImage),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Name(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Username(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeUsername(),
                        ),
                      );
                    },
                    child: Text('Change username'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
