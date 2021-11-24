import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tiktok_replica/screens/favorite_button.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('videos').snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final userDocs = userSnapshot.data!.docs;

              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  VideoPlayerController _controller =
                      VideoPlayerController.network(
                          userDocs[index]['videoUrl']);
                  VideoPlayer(
                    _controller
                      ..initialize()
                      ..pause(),
                  );

                  return Stack(children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(
                          _controller
                            ..initialize()
                            ..play()
                            ..setLooping(true),
                        ),
                      ),
                    ),
                    Positioned(
                        child: Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          // Wrap the play or pause in a call to `setState`. This ensures the
                          // correct icon is shown.

                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        },
                        // Display the correct icon depending on the state of the player.
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
    );
  }
}
