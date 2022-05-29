import 'dart:ui';

import 'package:basic/controllers/data_controller.dart';
import 'package:basic/donate.dart';
import 'package:basic/recieve.dart';
import 'package:basic/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basic/drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {

final _auth = FirebaseAuth.instance;

final DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("FOODO"),

      ),

      body: SingleChildScrollView(
        child: Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/homee.jpeg"),
          fit: BoxFit.cover,



        ),


      ),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


                Container(


                  alignment: Alignment.bottomCenter,

                  child: new Column(


                    children: <Widget>[

                      SizedBox(
                        height: 237.67,
                      ),
                      ButtonTheme(
                        minWidth: 200.0,
                        height: 100.0,
                        child: Column(
                          children: [

                            GestureDetector(
                              child: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(

                                  image: DecorationImage(
                                      image: AssetImage("assets/images/DONATE.png"),
                                      fit: BoxFit.cover
                                  ),


                                ),
                                child: Text("DONATE",
                                  style: TextStyle(color: Colors.orange,
                                      fontSize: 1),



                                ),


                              ),
                              onTap: (){
                                Get.to(() => DonatePage(),transition: Transition.leftToRight);

                              },
                            ),


                            // new RaisedButton(
                            // onPressed: (){
                            //Navigator.pushNamed(context, MyRoutes.donateRoute);
                            //},
                            //child: new Text("DONATE"),
                            //color: Colors.greenAccent,
                            //),


                            SizedBox(
                              height: 30.0,
                            ),
                            new RaisedButton(
                              onPressed: (){

                                Get.to(() => ReceiveFile(), transition: Transition.zoom );

                                //Navigator.pushNamed(context, MyRoutes.receiveRoute);
                              },
                              child: new Text("RECIEVE",
                                style: GoogleFonts.lato(),

                              ),
                              color: Colors.amber,
                            ),

                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 27.0,
                            ),
                            SizedBox(
                              height: 27.0,
                            ),
                            SizedBox(
                              height: 27.0,
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),


              ],


            ),

        ),
      ),
    ),




        ),
      ),


       /* body: SingleChildScrollView(
        child: Column(
          children: [


      Container(


             alignment: Alignment.bottomCenter,

             child: new Column(


               children: <Widget>[

                 SizedBox(
                   height: 237.67,
                 ),
               ButtonTheme(
                     minWidth: 200.0,
                      height: 100.0,
                      child: Column(
                        children: [
                          new RaisedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, MyRoutes.donateRoute);
                            },
                            child: new Text("DONATE"),
                            color: Colors.blueAccent,
                          ),
            SizedBox(
              height: 30.0,
            ),
                          new RaisedButton(
                            onPressed: (){},
                            child: new Text("RECIEVE"),
                            color: Colors.red,
                          ),
                        ],
                      ),
             ),


               ],
             ),
           ),


          ],

        ),
      ),*/

      /*floatingActionButton: FloatingActionButton(
        onPressed: () async{
           await  _auth.signOut();
           Navigator.pop(context);
        },
        child: Icon(Icons.logout),
      ), */

      drawer: MyDrawer(),
    );
  }
}
