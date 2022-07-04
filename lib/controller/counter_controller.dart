import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  RxInt sum = 0.obs;

  void incrementCounter() {
    counter++;
    update();
  }

  void counterSum() {
    sum(sum.value + 5);
  }
}
