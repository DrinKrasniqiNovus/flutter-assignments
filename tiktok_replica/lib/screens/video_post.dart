import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('videos').get(),
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
                  VideoPlayer(
                    VideoPlayerController.network(userDocs[1]['videoUrl'])
                      ..initialize()
                      ..pause(),
                  );
                  return Stack(children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: VideoPlayerController.network(
                                userDocs[index]['videoUrl'])
                            .value
                            .aspectRatio,
                        child: VideoPlayer(
                          VideoPlayerController.network(
                              userDocs[index]['videoUrl'])
                            ..initialize()
                            ..play(),
                        ),
                      ),
                    ),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
