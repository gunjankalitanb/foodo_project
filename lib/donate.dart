import 'dart:io';

import 'package:basic/controllers/data_controller.dart';
import 'package:basic/image_insert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'drawer.dart';
import 'main.dart';
class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  DataController controller = Get.find();
var  _userImageFile;
final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> productData = {
    "p_name": "",

    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": ""
  };

  void _pickedImage(File image) {
    _userImageFile = image;
    print("Image received $_userImageFile");


  }
  addProduct() {
    if (_userImageFile == null) {
      Get.snackbar(
        "Opps",
        "Image Required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme
            .of(context)
            .errorColor,
        colorText: Colors.white,
      );
      return;
    }




      _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");

      print('Data for new product $productData');
  controller.addNewProduct(productData, _userImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Details of Food'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Donor Name Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_name'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                      icon: Icon(Icons.home),
                      labelText: ' Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Donor Address Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_price'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.call),
                      labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number  Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['phone_number'] = value!;
                  },
                ),




                SizedBox(
                  height: 30,
                ),


                ImageInsert( _pickedImage),

                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 30,
                ),



                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(Icons.drive_file_rename_outline),
                      labelText: ' Food Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_price'] = value!;
                  },
                ),

                ElevatedButton(
                  onPressed: addProduct,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),

      drawer: MyDrawer(),
    );
  }
}
