import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen();
  // final void Function(XFile pickedVideo) imagePickFn;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isInit = true;
  final ImagePicker _picker = ImagePicker();
  XFile? pickedVideo;
  void getFunction() async {
    XFile? _pickedVideo = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: Duration(
        seconds: 30,
      ),
    );
  }

  VideoPlayerController? videoPlayerController;
  Future<void> _recordVideo() async {
    String? videoPath;
    XFile? _pickedVideo;
    _picker
        .pickVideo(
            source: ImageSource.camera, maxDuration: Duration(seconds: 30))
        .then((XFile? recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        _pickedVideo = recordedVideo;
        videoPath = recordedVideo.path;
        videoPlayerController =
            VideoPlayerController.file(File(recordedVideo.path))
              ..initialize().then((_) async {
                setState(() {});
                var userId = FirebaseAuth.instance.currentUser!.uid;
                final ref = FirebaseStorage.instance
                    .ref()
                    .child('videos')
                    .child(Timestamp.now().toString() + '.mp4');

                await ref.putFile(File(videoPath!));
                final userData = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .get();

                final url = await ref.getDownloadURL();
                await FirebaseFirestore.instance
                    .collection('videos')
                    .doc()
                    .set({
                  'author': {
                    'imageUrl': userData['imageUrl'],
                    'userName': userData['userName']
                  },
                  'authorId': userId,
                  'timestamp': Timestamp.now(),
                  'videoUrl': url,
                });
                print(url + 'ssssss');

                videoPlayerController!.play();
                videoPlayerController!.setVolume(0.0);
              });
        setState(() {
          pickedVideo = recordedVideo;
        });
        print(videoPlayerController);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      _recordVideo();
      isInit = false;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (videoPlayerController!.value.isPlaying) {
                  videoPlayerController!.pause();
                } else {
                  videoPlayerController!.play();
                }
              });
            },
            icon: Icon(
              videoPlayerController!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ],
      ),
      body: videoPlayerController == ''
          ? Center(child: Text('No videos Selcted'))
          : VideoPlayer(videoPlayerController!),
    );
  }
}
