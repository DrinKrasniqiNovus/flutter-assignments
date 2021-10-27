import 'package:flutter/material.dart';
import '../widgets/username.dart';
import '../widgets/profile_picure.dart';
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
        appBar: AppBar(
          title: Text(
            'My Profile',
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
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
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_view,
                        color: Colors.black,
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
