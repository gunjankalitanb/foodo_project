import 'package:basic/Login_Page.dart';
import 'package:basic/about.dart';
import 'package:basic/donate.dart';

import 'package:basic/home_page.dart';
import 'package:basic/image_upload.dart';
import 'package:basic/recieve.dart';
import 'package:basic/registration.dart';
import 'package:basic/reset_password.dart';
import 'package:basic/signup.dart';
import 'package:basic/splash.dart';

import 'package:basic/utils/password.dart';
import 'package:basic/utils/routes.dart';
import 'package:basic/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




import 'Login_page2.dart';
import 'first_page.dart';


//import 'home_page.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
     initialRoute:MyRoutes.splashRoute,
     routes: {

        // "/": (context) => WelcomePage(),
       MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
       MyRoutes.registerRoute : (context) => RegisterPage(),
       MyRoutes.passwordRoute : (context) => PasswordPage(),
      MyRoutes.welcomeRoute : (context) => WelcomePage(),

      MyRoutes.imageRoute : (context) => ImageUpload(),
       MyRoutes.receiveRoute : (context) => ReceiveFile(),
       MyRoutes.SignUpRoute : (context) => SignUpScreen(),
       MyRoutes.LoginRoute : (context) => LoginScreen(),
       MyRoutes.donateRoute : (context) => DonatePage(),
       MyRoutes.firstRoute : (context) => FirstPage(),
       MyRoutes.aboutRoute : (context) => AboutPage(),
       MyRoutes.splashRoute : (context) => SplashScreen(),
       MyRoutes.resetRoute : (context) => ResetPassword(),

     },
        debugShowCheckedModeBanner: false,
    );

  }
}




// title: "Welcome to flutter",
//
// home: HomePage(),
//themeMode: ThemeMode.light,
//theme: ThemeData(
//primarySwatch: Colors.deepPurple
//),
//darkTheme: ThemeData(
//brightness: Brightness.dark,
//routes: {
//"/" : (context) => HomePage(),
//},