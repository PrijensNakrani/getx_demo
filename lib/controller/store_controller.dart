import 'package:get/get.dart';
import 'package:getx_demo/api_services/api_services.dart';

import '../model/store_model.dart';

class StoreController extends GetxController {
  RxBool isLoading = true.obs;
  var storeList = <StoreModel>[].obs;

  @override
  void onInit() {
    fatchStore();
    super.onInit();
  }

  void fatchStore() async {
    isLoading(true);
    try {
      final store = await ApiServices.getFakeStore();
      if (store != null) {
        storeList.value = store;
      }
    } finally {
      isLoading(false);
    }
  }
}
