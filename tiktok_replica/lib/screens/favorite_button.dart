import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final String url;
  FavoriteButton(this.url);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

var userId = FirebaseAuth.instance.currentUser!.uid;
bool isInit = true;
List myFavs = [];
bool isFavorite = false;
void getFavs() async {
  final user = await FirebaseAuth.instance.currentUser;
  final userData =
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
  myFavs = userData['favoriteVids'] as List;
}

void update(bool isFavorite, String videoUrl) {
  var collection = FirebaseFirestore.instance.collection('users');
  if (isFavorite == true) {
    collection.doc(userId).update({
      'favoriteVids': FieldValue.arrayUnion([videoUrl])
    }); // <-- Updated data
  } else {
    collection.doc(userId).update({
      'favoriteVids': FieldValue.arrayRemove([videoUrl])
    });
  }
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    isFavorite = myFavs.contains(widget.url);
    if (isInit) {
      getFavs();

      isInit = false;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
            update(isFavorite, widget.url);
            if (isFavorite == true) {
              myFavs.add(widget.url);
            } else {
              myFavs.remove(widget.url);
            }
          });
        },
        icon: isFavorite
            ? Icon(Icons.favorite, size: 35, color: Colors.red)
            : Icon(
                Icons.favorite_border_outlined,
                size: 35,
                color: Colors.white,
              ),
      ),
    );
  }
}
