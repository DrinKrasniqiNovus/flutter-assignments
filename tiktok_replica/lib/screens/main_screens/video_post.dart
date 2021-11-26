import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_replica/screens/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  StreamController<List<DocumentSnapshot>> _streamController =
      StreamController<List<DocumentSnapshot>>();
  List<DocumentSnapshot> _posts = [];
  bool _isRequesting = false;
  bool _isFinish = false;

  void requestNextPage() async {
    if (!_isRequesting && !_isFinish) {
      QuerySnapshot querySnapshot;
      _isRequesting = true;
      if (_posts.isEmpty) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('videos')
            .orderBy('timestamp')
            .limit(2)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('videos')
            .orderBy('timestamp')
            .startAfterDocument(_posts[_posts.length - 1])
            .limit(2)
            .get();
      }
      if (querySnapshot != null) {
        int oldSize = _posts.length;
        _posts.addAll(querySnapshot.docs);
        int newSize = _posts.length;
        if (oldSize != newSize) {
          _streamController.add(_posts);
        } else {
          _isFinish = true;
        }
      }
      _isRequesting = false;
    }
  }

  @override
  void initState() {
    requestNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.maxScrollExtent == scrollInfo.metrics.pixels) {
          requestNextPage();
        }
        return true;
      },
      child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('videos')
            .orderBy('timestamp')
            .get(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder<List<DocumentSnapshot>>(
              stream: _streamController.stream,
              builder:
                  (ctx, AsyncSnapshot<List<DocumentSnapshot>> userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final userDocs = userSnapshot.data!;

                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) {
                    VideoPlayerController _controller =
                        VideoPlayerController.network(
                            userDocs[index]['videoUrl']);
                    VideoPlayer(_controller);

                    return Stack(children: [
                      Positioned.fill(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller
                            ..initialize()
                            ..play()),
                        ),
                      ),
                      Positioned(
                          child: Center(
                        child: FloatingActionButton(
                          onPressed: () {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          },
                          child: Icon(Icons.play_arrow),
                        ),
                      )),
                      Positioned(
                        bottom: 50,
                        left: 25,
                        child: Text(
                          '@' + userDocs[index]['author']['userName'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 25,
                        bottom: 250,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(
                                  userDocs[index]['author']['imageUrl']),
                              radius: 30,
                            ),
                            FavoriteButton(userDocs[index]['videoUrl'])
                          ],
                        ),
                      ),
                    ]);
                  },
                  itemCount: userDocs.length,
                );
              });
        },
      ),
    );
  }
}
