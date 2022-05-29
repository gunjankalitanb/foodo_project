

import 'package:basic/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basic/main.dart';
enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool _showLoading = false;
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      _showLoading= true;
    });


    try {
      final _authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        _showLoading = false;
      });
      if(_authCredential.user != null) {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }


    }
    on FirebaseAuthException catch (e) {
      // TODO
      setState(() {
        _showLoading= false;
      });
      _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text("e.message")));
    }

  }

  getMobileFormWidget(context) {
    return Column(
      children: [



        Spacer(),
        TextField(
          controller: phoneController,

          decoration: InputDecoration(
            icon: Icon(Icons.phone),
            labelText: "Phone Number",
            hintText: "Enter +91 in the begining",
          ),
        ),
        SizedBox(
          height: 16,
        ),

        FlatButton(onPressed: () async {
          setState(() {
            _showLoading = true;
          });
          await  _auth.verifyPhoneNumber(
            phoneNumber: phoneController.text,
            verificationCompleted: (phoneAuthCredential) async{
              setState(() {
                _showLoading = false;
              });


            },
            verificationFailed: (verificationFailed) async{
              setState(() {
                _showLoading = false;
              });

              _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("verificationFailed.message")));
            },
            codeSent: (verificationId, resendingToken) async{
              setState(() {
                _showLoading = false;
                currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                this.verificationId = verificationId;
              });
            },
            codeAutoRetrievalTimeout: (verificationId) async{

            },
          );
        },
          child:  Text("SEND"),
          color: Colors.blue,
          textColor: Colors.deepPurple,
        ),
        Spacer(),
      ],
    );

  }
  getOtpFormWidget(context){
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),

        FlatButton(onPressed: () async{

          PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
          signInWithPhoneAuthCredential(phoneAuthCredential);
        },
          child:  Text("Verify"),
          color: Colors.blue,
          textColor: Colors.deepPurple,
        ),
        Spacer(),
      ],
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body:Container(
          child: _showLoading ? Center(child: CircularProgressIndicator(),) : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE ?
          getMobileFormWidget(context)  :
          getOtpFormWidget(context),
          padding: EdgeInsets.all(16),
        )
    );
  }
}


