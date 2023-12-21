import 'package:get/get.dart';

class MyCounter extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
