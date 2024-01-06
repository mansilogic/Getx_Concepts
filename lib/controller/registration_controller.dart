// ignore_for_file: avoid_print

import 'package:get/get.dart';

class RegistrationController extends GetxController {
//  List<Map<String, String>> registeredUsers = [];
// Map<String, String> formData = {};
  RxList registeredUsers = [].obs;
  RxMap formData = {}.obs;

  void addFormData(String field, String value) {
    formData.addAll({field: value});
  }

  void submitForm() {
    registeredUsers.add(Map.from(formData));
    // formData.clear();
    print("========>formdata=== $formData");
    print("========>registeredusers== $registeredUsers");

    Get.toNamed('/success');
  }
}
