import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/fullscreen_video.dart';
import 'package:video_player/video_player.dart';
import '../../getters/posts.dart';

class MyVideos extends StatelessWidget {
  const MyVideos({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 160,
          mainAxisExtent: 200,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        primary: false,
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreen(),
                ),
              );
            },
            child: VideoPlayer(
                VideoPlayerController.network((items[index] as Post).videoUrl)
                  ..initialize()
                  ..setVolume(0.0)
                  ..play()
                  ..setLooping(true)),
          );
        },
      ),
    );
  }
}
