import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controller/registration_controller.dart';

class SuccessPage extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> registeredUsers = controller.registeredUsers;
    RxList registeredUsers = controller.registeredUsers;

    return Scaffold(
        appBar: AppBar(
          title: Text('Registered Users'),
          backgroundColor: const Color.fromARGB(255, 229, 161, 140),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: registeredUsers.length,
            itemBuilder: (context, index) {
              print(">>>>>>>>>>>>>>>>>>>>>>>>>>>. $registeredUsers");
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('User ${index + 1}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${registeredUsers[index]['Name']}'),
                      Text('Email: ${registeredUsers[index]['Email']}'),
                      Text('Password: ${registeredUsers[index]['Password']}'),
                      Text('Phone:${registeredUsers[index]['Phone']}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
