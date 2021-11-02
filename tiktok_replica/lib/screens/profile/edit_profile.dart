import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/widgets/name.dart';
import 'package:tiktok_replica/screens/widgets/profile_picture.dart';
import 'package:tiktok_replica/screens/widgets/username.dart';

import 'change_username.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          ProfilePicture(),
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
