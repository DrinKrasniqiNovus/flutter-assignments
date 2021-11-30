import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/widgets/favorite_button.dart';
import 'package:video_player/video_player.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
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
            stream: FirebaseFirestore.instance
                .collection('videos')
                .where('authorId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final userDocs = userSnapshot.data!.docs;

              return Scaffold(
                body: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) {
                    VideoPlayerController _controller =
                        VideoPlayerController.network(
                            userDocs[index]['videoUrl']);

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
                ),
              );
            });
      },
    );
  }
}
