import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // Map<String, String> userSignupData = {
  //
  //   "email": "",
  //
  // };

  AuthController controller = Get.find();

  // signUp() {
  //   if (_formKey.currentState!.validate()) {
  //     print("Form is valid ");
  //     _formKey.currentState!.save();
  //     print('User Sign Up Data $userSignupData');
  //     controller.signUp(userSignupData['email'], userSignupData['password'], userSignupData['username']);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,

        title: Text('Reset Password'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
           // key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2017/05/15/13/56/sign-up-2314914_1280.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  TextFormField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: 'Email',


                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Email Required';
                    //   }
                    //   return null;
                    // },
                    // onSaved: (value) {
                    //   userSignupData['email'] = value!;
                    // },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email:_emailTextController.text)
                          .then((value) => Navigator.of(context).pop());

                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
