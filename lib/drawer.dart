import 'package:basic/about.dart';
import 'package:basic/controllers/auth_controller.dart';
import 'package:basic/controllers/data_controller.dart';
import 'package:basic/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'donation.dart';
class MyDrawer extends StatelessWidget {
final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration:
                BoxDecoration(color: Theme.of(context).primaryColor),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'User : ${controller.userProfileData['userName']}',

                      style: TextStyle(

                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                    FittedBox(
                      child: Text(
                        'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('My Donations'),
                onTap: () {
          Get.back();
                Get.to(()=>YourDonation());
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: const Text('About'),
                onTap: () {
                  Get.back();
                  Get.to(()=>AboutPage(), transition:  Transition.circularReveal);
                },
              ),


              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
      AuthController.logOut();

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
