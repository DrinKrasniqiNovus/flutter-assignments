import 'package:flutter/material.dart';
import '../profile/edit_profile.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfile()),
            );
          },
          child: Text('EditProfile'),
        ),
      ),
    );
  }
}
