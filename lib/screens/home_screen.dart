import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constant/text_style.dart';
import '../widgets/post_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').orderBy("datetime" , descending: true).snapshots(),
        builder: (BuildContext context,
             AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Column(
              children: [
                Text("POST ${snapshot.data!.docs.length - index} ", style: style5),
                PostContainer(docid: snapshot.data!.docs[index]),
              ],
            ),
          );
        },
      )
    );

  }
}
