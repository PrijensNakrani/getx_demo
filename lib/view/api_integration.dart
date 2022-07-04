import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/internet_controller.dart';
import 'package:getx_demo/controller/product_contrller.dart';

class ApiIntegration extends StatefulWidget {
  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  ProductController productController = Get.put(ProductController());

  ConnectivityProvider connectivityProvider = Get.put(ConnectivityProvider());
  @override
  void initState() {
    connectivityProvider.startMonitoring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
            )
          ],
        ),
        body: SafeArea(
          child: GetBuilder<ConnectivityProvider>(
            builder: (controller) {
              if (controller.isOnline != null) {
                return connectivityProvider.isOnline == true
                    ? Obx(() {
                        if (productController.isLoading.value) {
                          return const Center(
                              child: CupertinoActivityIndicator());
                        } else {
                          return MasonryGridView.count(
                            itemCount: productController.productList.length,
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemBuilder: (context, index) {
                              final makeup =
                                  productController.productList[index];
                              return Card(
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Image.network("${makeup.imageLink}"),
                                        const Positioned(
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "${makeup.name}",
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    makeup.rating == null
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 100),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${makeup.rating}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        "\$${makeup.price}",
                                        textScaleFactor: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                          ;
                        }
                      })
                    : const Center(
                        child: Text(
                        "No Internet",
                        textScaleFactor: 3,
                      ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
