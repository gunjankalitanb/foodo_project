import 'package:basic/main.dart';
import 'package:basic/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:basic/main.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

/*void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} */

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 // final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;
  void _register() async {
   final User? user=(
   await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
   ).user;
   if(user != null){
     setState(() {
      _success=true;
      _userEmail=user.email!;
     });
   } else{
     setState(() {
       _success=false;
     });
   }
   Navigator.pushNamed(context, MyRoutes.loginRoute);
   setState(() {
     _success=true;
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                  child: Text("ACCOUNT DETAILS ",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_rounded),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height:5.0,
          ),

          SizedBox(
            height: 40.0,
          ),

          Container(
            height: 38,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              shadowColor: Colors.greenAccent,
              color: Colors.pink,
              elevation: 5,
              child: GestureDetector(
                onTap: () async {
                  _register();

                },
                child: Center(
                  child: Text("Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 40.0,
          ),




          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Text("Cancel",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
                )
                ),

              ),
            ],
          )


        ],
      )
    );
  }
}

