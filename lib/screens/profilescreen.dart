import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/services/bakeryservice.dart';

class ProfileScreen extends StatelessWidget {
  final bakeryService = Get.put(BakeryService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetX<BakeryService>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.bakes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.bakes[index].email.toString()),
              );
            },
          );
        }),
      ),
    );
  }
}
