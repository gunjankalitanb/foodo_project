import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';


import 'Login_page2.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/images.jpg",




        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.limeAccent,


      ),
    );
  }
}
