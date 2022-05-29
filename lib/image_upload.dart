import 'dart:io';

import 'package:basic/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ImageUpload extends StatefulWidget {
  //need to create id to create respective folder for user
  String? userId;
  ImageUpload({Key? key, this.userId}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  File? _image;  //importing file will import dart.html. and we need to change it to dart.io
  final imagePicker = ImagePicker();
  String? downloadURL;

  //Image picker

  Future imagePickerMethod() async{
    //defining pick value which will pick image from our gallery
    final pick = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pick !=null) {
        _image = File(pick.path);
      }
      else
        {
          //snackbar for showing error
          
          showSnackbar("No file selected",
              Duration(microseconds: 400)
          );
        }
    });

  }
  //uploading image and getting the url
  //adding that url to firestore


  Future uploadImage() async {
String  imgId = DateTime.now().microsecondsSinceEpoch.toString();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref().child("images").child("users$imgId");
  await ref.putFile(_image!);
  downloadURL = await ref.getDownloadURL();


  await firebaseFirestore.collection("users").doc(widget.userId).collection("images").add({'downloadURL': downloadURL});
  }



showSnackbar(String snackText, Duration d) {
    final snackBar= SnackBar(content: Text(snackText), duration: d,);
    ScaffoldMessenger.of(context).showSnackBar( snackBar );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ClipRRect(     //create rectangular box
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Upload Image"),
                  SizedBox(
                    height:18,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child:_image == null? const Center(child: Text("No image Selected"),
                                ) : Image.file(_image!),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                imagePickerMethod();

                              },
                              child: Text("Select Image"),
                            ),
                            ElevatedButton(
                              onPressed: (){

                                if(_image != null) {
                                  uploadImage().whenComplete(() =>
                                  showSnackbar(
                                      "Image uploaded sucessfully",
                                  Duration(seconds: 2)));
                                }
                                else{
                                  showSnackbar("Select Image First",
                                  Duration(milliseconds: 700));
                                }

                              },
                              child: Text("Upload Image"),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                ],
              ),

            ),
          ), //for rounded rectangular clip
        ),
      ),
    );
  }
}
