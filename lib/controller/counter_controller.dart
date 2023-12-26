import 'package:get/get.dart';

class MyCounter extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update();
  }
}
