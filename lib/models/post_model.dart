import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String text;
  String? image;
  DateTime datetime;
  String nickName;


  Post(
      {required this.id,
        required this.text,
        required this.image,
        required this.datetime,
        required this.nickName,

      });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        id: snapshot["id"],
        text: snapshot["text"],
        image: snapshot['image'],
        datetime: snapshot['datetime'],
      nickName: snapshot["nickName"]
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "image": image,
    "datetime": datetime,
    "nickName": nickName
  };
}