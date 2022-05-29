import 'dart:convert';

import 'package:basic/controllers/dialog.dart';
import 'package:basic/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login_page2.dart';

class AuthController  extends GetxController {
  var userId;


 Future<void> signUp(email, password, username) async
  {
    try {
      CommanDialog.showLoading();
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password
      );
      print(userCredential);
      CommanDialog.hideLoading();
//Query For Adding User on Firebase Firrestore DataBase
      try {
        CommanDialog.showLoading();
        var response =
        await FirebaseFirestore.instance.collection('userslist').add({
          'user_Id': userCredential.user!.uid,
          'user_name': username,
          "password": password,
          'joinDate': DateTime.now().millisecondsSinceEpoch,
          'email': email
        });
        print("Firebase response1111 ${response.id}");
        CommanDialog.hideLoading();

      } catch (exception) {
        CommanDialog.hideLoading();
        print("Error Saving Data at firestore $exception");
      }


      Get.back();
    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();

      if (e.code == 'weak-password') {
        CommanDialog.showErrorDialog(description: "The password provided is too weak.");

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommanDialog.showErrorDialog(description: "The account already exists for that email.");
        print('The account already exists for that email.');
      }

    } catch (e) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog(description: "Something Went Wrong");
      print(e);
    }

  }

  Future<void> login(email,password) async{

   print('$email,$password');

    try {
      CommanDialog.showLoading();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password
      );

      print(userCredential.user!.uid);   //not empty uid
      userId = userCredential.user!.uid;   //save credential in userId variable
      CommanDialog.hideLoading();


      var response = {"user_id": "99", "user_token": "xx8894jjdsdhsuur"};
      var any = await SharedPreferences.getInstance();

      any.setString("$email,$password", json.encode(response));

      Get.off(()=>HomePage());



    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();

      if (e.code == 'user-not-found') {
        CommanDialog.showErrorDialog(description: "No user found for that email.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommanDialog.showErrorDialog(description: "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    }
  }
  Future<bool> tryAutoLogin(email,password) async{
   var any = await SharedPreferences.getInstance();
   if(!any.containsKey("$email,$password")){
     return false;


   }
   else{

     return true;
   }

}
  static logOut() async{
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  Get.off(() => LoginScreen());
  }
}