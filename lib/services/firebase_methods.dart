import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/services/storage_services.dart';
import 'package:uuid/uuid.dart';
import '../models/post_model.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String text,
      File? file,
      String nickName,
      ) async {

    String res = "Some error occurred";
    try {
      String? photoUrl;
      if (file == null) {
        photoUrl =  null;
      } else {
        photoUrl =
        await StorageService.uploadPicture(file);
      }
      String postId = const Uuid().v1();
      Post post = Post(
          id: postId,
          text: text,
          image: photoUrl,
          datetime: DateTime.now(),
        nickName: nickName
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updatePost(String text,
      File? file,
      String nickName,
      String id,
      String image
      ) async {

    String res = "Some error occurred";
    try {

      String? photoUrl;
      if (file == null) {
        photoUrl = image;
      } else {
        photoUrl =
        await StorageService.uploadPicture(file);
      }

      _firestore.collection('posts').doc(id).update({"text" : text, "nickName" : nickName , "image" : photoUrl
      });
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }


}