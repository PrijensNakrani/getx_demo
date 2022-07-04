import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/store_controller.dart';

class StoreView extends StatelessWidget {
  StoreController storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (storeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: storeController.storeList.length,
            itemBuilder: (context, index) {
              final store = storeController.storeList[index];
              return ListTile(
                title: Text(store.title.toString()),
              );
            },
          );
        }
      }),
    );
  }
}
