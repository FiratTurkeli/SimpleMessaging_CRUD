import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/screens/tabs_screen.dart';
import 'package:social_media_app/services/firebase_methods.dart';
import '../constant/color.dart';
import '../constant/text_style.dart';
import '../widgets/rounded_button.dart';

class NewPostScreen extends StatefulWidget {

  const NewPostScreen({ Key? key,}) : super(key: key);
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  File? _file;
  bool isLoading = false;
  final TextEditingController textController = TextEditingController();
  final TextEditingController nameController = TextEditingController();




  handleImageFromGallery() async {
    try {
      final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      File file = File(imageFile!.path);
      if (imageFile != null) {
        setState(() {
          _file = file;
        });
      }
    } catch (e) {
      print(e);
    }
  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                color: white,
                child: TextField(
                  cursorColor: primary,
                  style: const TextStyle(color: primary),
                  decoration: const InputDecoration(
                    enabled: true,
                    suffixStyle: TextStyle(color: primary),
                    hintStyle: style4,
                    counterStyle: TextStyle(color: primary),
                    hintText: 'Enter your Full Name',
                    fillColor: primary,
                    focusColor: primary,
                    hoverColor: primary,
                    iconColor: primary,
                    prefixIconColor: primary,
                    suffixIconColor: primary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary, ),
                    ),
                  ),
                  onChanged: (value) {
                    nameController.text = value;
                  },
                ),
              ),

              const SizedBox(height: 10),


              TextField(
                maxLength: 280,
                maxLines: 7,
                cursorColor: white,
                style: const TextStyle(color: white),
                decoration: const InputDecoration(
                  suffixStyle: TextStyle(color: white),
                  hintStyle: style2,
                  alignLabelWithHint: true,
                  counterStyle: TextStyle(color: white),
                  hintText: 'Enter your message.. ',
                  fillColor: white,
                  focusColor: white,
                  hoverColor: white,
                  iconColor: white,
                  prefixIconColor: white,
                  suffixIconColor: white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primary)
                  ),
                ),
                onChanged: (value) {
                  textController.text = value;
                },
              ),

              const SizedBox(height: 10),
              _file == null
                  ? const SizedBox.shrink()
                  :
              Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: myGreen,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(_file!),
                        )),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              GestureDetector(
                onTap: handleImageFromGallery,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    border: Border.all(
                      color: white,
                      width: 2,
                    ),

                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RoundedButton(
                btnText: 'New Post',
                onBtnPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (textController.text.isNotEmpty) {
                    String res = "Some error occurred";
                    FireStoreMethods().uploadPost(textController.text, _file, nameController.text);
                    res = "success";
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TabsScreen()));

                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              const SizedBox(height: 20),
              isLoading ? const CircularProgressIndicator() : const SizedBox.shrink(),


            ],
          ),
        ),
      ),
    );
  }
  

}