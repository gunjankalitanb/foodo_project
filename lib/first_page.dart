import 'package:basic/Login_page2.dart';
import 'package:basic/utils/routes.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  bool _isloaded=false;
   AnimationController? _controller;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(

        vsync: this,
      duration: const Duration(milliseconds: 500),

    );

    _controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        {
          setState(() {
            _isloaded=true;
          });
        }
    });
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  bool animate = false;
  Widget build(BuildContext context) {
    return Scaffold(
     body:Center(
       child: _isloaded ?GestureDetector(
         onTap: (){
           Text("GET STARTED");
           Navigator.pushNamed(context, MyRoutes.LoginRoute);
         },

       ): Lottie.asset('assets/images/animate.json',
       controller: _controller,
       onLoaded: (comp) async {
         _controller?.duration = comp.duration;
         _controller?.forward();
       //await Navigator.pushNamed(context, MyRoutes.LoginRoute);

       }
       ),
       

     ),
    );
  }
}
