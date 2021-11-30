import 'package:flutter/material.dart';
import 'package:tiktok_replica/screens/profile/videos/fullscreen2_video.dart';
import 'package:video_player/video_player.dart';

class Favorite extends StatelessWidget {
  Favorite({
    Key? key,
    required this.myFavs,
  }) : super(key: key);
  List myFavs = [];

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
          itemCount: myFavs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreen2(),
                  ),
                );
              },
              child: VideoPlayer(
                  VideoPlayerController.network(myFavs[index].toString())
                    ..initialize()
                    ..setVolume(0.0)
                    ..play()),
            );
          },
        ));
  }
}
