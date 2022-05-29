import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOUT",
          textAlign: TextAlign.center,
        ),
      ),
     body: Column(
       children: [
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         SizedBox(
           height: 20,
         ),
         Container(
           alignment: Alignment.center,
           child: Text("THE FUCKING DISASTERIOUS APP CREATED FOR SOME FUCKING REASON THAT I DON'T KNOW, AND YOU DARE TO KNOW IT BITCH ;)",
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
               color: Colors.blueGrey,

             ),
           ),
         ),

         SizedBox(
           height: 60,
         ),
         GestureDetector(
           child: Text("TAP TO KILL IT",

           style: TextStyle(
             fontSize: 40,
             color: Colors.red,
           ),
           ),
           onTap: (){
             SystemNavigator.pop();


           },
         ),
       ],
     ),

    );
  }
}
