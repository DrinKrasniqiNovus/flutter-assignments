import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/profile/videos/favorite.dart';
import 'package:tiktok_replica/screens/getters/posts.dart';
import '../profile/videos/my_videos.dart';

class TabBarItems extends StatefulWidget {
  @override
  State<TabBarItems> createState() => _TabBarItemsState();
}

class _TabBarItemsState extends State<TabBarItems> {
  List myFavs = [];
  var items = [];
  bool isInit = true;
  Future<void> getVideos() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('videos')
        .where('authorId', isEqualTo: user)
        .get();

    if (query.docs.length < 0) {
      return;
    } else if (query.docs.length > 0) {
      var myData = query.docs
          .map((e) => Post(
              id: e.id,
              author: {
                'userName': e['author']['userName'],
                'imageUrl': e['author']['imageUrl'],
              },
              userName: e['author']['userName'],
              authorId: user,
              imageUrl: e['author']['imageUrl'],
              timeStamp: e['timestamp'],
              videoUrl: e['videoUrl']))
          .toList();

      setState(() {
        items = myData;
      });
    }
  }

  void getFavs() async {
    final user = await FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    myFavs = userData['favoriteVids'];
    print(myFavs);
  }

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      getVideos();
      getFavs();
      isInit = false;
    }

    return Expanded(
      child: TabBarView(
        children: [
          // first tab bar view widget
          MyVideos(items: items),
          Favorite(myFavs: myFavs),
        ],
      ),
    );
  }
}
