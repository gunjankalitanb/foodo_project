import 'package:basic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/data_controller.dart';
class YourDonation extends StatelessWidget {
  final DataController controller = Get.find();


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getLoginUserProduct();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("My Donation"),
      ),
      body: GetBuilder<DataController>(
        builder: (controller) => controller.loginUserData.isEmpty
            ? Center(
          child: Text('PLEASE DONATE FIRST'),
        )
            : ListView.builder(
          itemCount: controller.loginUserData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      controller.loginUserData[index].productimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Donor Name: ${controller.loginUserData[index].productname}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        ElevatedButton(
                          onPressed: () {

                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),



    );
  }
}
