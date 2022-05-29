import 'package:basic/controllers/auth_controller.dart';
import 'package:basic/reset_password.dart';
import 'package:basic/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userLoginData = {"email": "", "password": ""};

  AuthController controller = Get.put(AuthController());

  login() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('Data for login $userLoginData');
      controller.login(userLoginData['email'],userLoginData['password'] );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      'https://www.maxpixel.net/static/photo/1x/Icon-Business-Profile-Person-Avatar-Symbol-User-5355896.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userLoginData['email'] = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userLoginData['password'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),


                  ElevatedButton(
                    onPressed: login,


                    child: Text('Login Now'),

                  ),
                  SizedBox(
                    height: 10,
                  ),

                  forgetPassword(context),



                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.SignUpRoute);
                      },
                      child: Text(
                        "Don't Have an Account ? Sign up",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),

                      ),

                    ),

                  ),
                  // Container(
                  //   alignment: Alignment.bottomRight,
                  //   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, MyRoutes.SignUpRoute);
                  //     },
                  //     child: Text(
                  //       "Forgot Password",
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.bold,
                  //         color: Theme.of(context).primaryColorDark,
                  //       ),
                  //
                  //     ),
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget forgetPassword(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text("Forgot Password?",
        textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPassword())) ,
      ),
    );

  }
}
