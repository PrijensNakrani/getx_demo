import 'package:get/get.dart';
import 'package:getx_demo/api_services/api_services.dart';
import 'package:getx_demo/model/products.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  var productList = <Products>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      final products = await ApiServices.getProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
