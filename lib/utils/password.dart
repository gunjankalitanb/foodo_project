import 'package:basic/utils/routes.dart';
import 'package:flutter/material.dart';
class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(

        children: [
          SizedBox(
            height: 80.0,

          ),

          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Password",
              labelText: "Password",
            ),

          ),

          SizedBox(
            height: 20.0,

          ),

          TextFormField(
            decoration: InputDecoration(
              hintText: "Re-Type your Password",
              labelText: "Confirm Password",
            ),

          ),

          SizedBox(
            height: 20.0,

          ),


         InkWell(
           onTap: () {
             Navigator.pushNamed(context,  MyRoutes.loginRoute);

           },
           child: AnimatedContainer(

             duration: Duration(seconds: 1),
             width: 100,
             height: 50,
             color: Colors.deepPurple,
             alignment: Alignment.center,
             child: Text("Confirm",
               style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
               ),
             ),
           ),
         ),
        ],

      ),


    );
  }
}

