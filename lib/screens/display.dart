import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controller/registration_controller.dart';

class SuccessPage extends GetView<RegistrationController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> registeredUsers = controller.registeredUsers;
    //RxList registeredUsers = controller.registeredUsers;
    //RxBool isPro = false.obs;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Registered Users'),
          backgroundColor: const Color.fromARGB(255, 229, 161, 140),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: controller.registeredUsers.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('User ${index + 1}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Name: ${controller.registeredUsers[index]['Name']}'),
                      Text(
                          'Email: ${controller.registeredUsers[index]['Email']}'),
                      Text(
                          'Password: ${controller.registeredUsers[index]['Password']}'),
                      Text(
                          'Phone:${controller.registeredUsers[index]['Phone']}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
