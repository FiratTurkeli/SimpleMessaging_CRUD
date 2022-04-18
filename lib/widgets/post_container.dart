import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/screens/edit_post_screen.dart';
import 'package:social_media_app/screens/tabs_screen.dart';

import '../constant/color.dart';
import '../constant/text_style.dart';



class PostContainer extends StatefulWidget {

  DocumentSnapshot docid;

   PostContainer({Key? key, required this.docid})
      : super(key: key);
  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {



  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage:
                  AssetImage("assets/user.png")
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  const Text("Name : " , style: style6,),
                  Text(
                    widget.docid['nickName'].toString(),
                    style: style2
                  ),


                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                const Text("Message : " , style: style6,),
                Text(
                  widget.docid['text'].toString() ,
                  style: style3
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                widget.docid['image'] == null ?
                    const Center()
                :Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.docid['image'].toString()),
                      )),
                )


              ],
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(left: 50.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPostScreen(docid: widget.docid)));
               }
                   , icon: const Icon(Icons.edit , color: Colors.white,)),

               IconButton(onPressed: (){
                 widget.docid.reference.delete().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TabsScreen())));
               }
                   , icon: const Icon(Icons.delete_rounded, color:  Colors.white,)),
             ],
           ),
         ),
          const Divider()
        ],
      ),
    );
  }
}