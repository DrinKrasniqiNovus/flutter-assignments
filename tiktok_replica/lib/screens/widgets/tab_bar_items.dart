import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/getters/posts.dart';

class TabBarItems extends StatefulWidget {
  @override
  State<TabBarItems> createState() => _TabBarItemsState();
}

class _TabBarItemsState extends State<TabBarItems> {
  var items = [];

  Future<void> getVideos() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('videos')
        .where('authorId', isEqualTo: user)
        .get();

    if (query.docs.length < 0) {
      return;
    } else if (query.docs.length > 0) {
      print('tttttttttttttttttttttttttttttt');
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
      print(myData);

      setState(() {
        items = myData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getVideos();

    return Expanded(
      child: TabBarView(
        children: [
          // first tab bar view widget
          Container(
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                primary: false,
                padding: const EdgeInsets.all(10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Text('Video');
                },
              )),

          // second tab bar viiew widget
          Container(
              color: Colors.white,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 30,
                crossAxisCount: 3,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(""),
                    color: Colors.teal[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(""),
                    color: Colors.teal[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: const Text(''),
                    color: Colors.teal[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                    color: Colors.teal[600],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
