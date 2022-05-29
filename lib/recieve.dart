import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'controllers/data_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceiveFile extends StatefulWidget {




  @override
  _ReceiveFileState createState() => _ReceiveFileState();
}

class _ReceiveFileState extends State<ReceiveFile> {
  final DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AVAILABLE FOODS"),

      ),
      body: GetBuilder<DataController>(
        builder: (controller) => controller.allProduct.isEmpty
            ? Center(
          child: Text('😔 NO DATA FOUND (: 😔'),
        )
            : ListView.builder(
          itemCount: controller.allProduct.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      controller.allProduct[index].productimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Donor Name: ${controller.allProduct[index].productname}",
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
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => launch("tel:${controller.allProduct[index].phonenumber.toString()}"),

                            child: Text('CALL'),
                          ),
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
