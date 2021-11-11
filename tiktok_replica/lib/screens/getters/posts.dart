import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userName;
  final String imageUrl;
  final String authorId;
  final Timestamp timeStamp;
  final String videoUrl;
  final Map author;
  Post(
      {required this.author,
      required this.id,
      required this.userName,
      required this.authorId,
      required this.imageUrl,
      required this.timeStamp,
      required this.videoUrl});
}
