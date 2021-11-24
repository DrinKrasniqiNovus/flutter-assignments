import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/getters/profile_picture.dart';
import '../getters/username.dart';
import '../widgets/stats.dart';
import '../widgets/edit_profile_button.dart';
import '../widgets/tab_bar_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
          title: Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 10,
        ),
        body: Column(
          children: <Widget>[
            ProfilePicture(),
            Username(),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Stats(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditProfileButton(),
              ],
            ),
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.grey[900],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_view,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TabBarItems(),
          ],
        ),
      ),
    );
  }
}
