import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _fireStore = FirebaseFirestore.instance;

final storageRef = FirebaseStorage.instance.ref();

final postsRef = _fireStore.collection('posts');



