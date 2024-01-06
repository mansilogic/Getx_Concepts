// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controller/registration_controller.dart';

class RegistrationForm extends StatelessWidget {
  final RegistrationController controller = RegistrationController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
      body: GetBuilder<RegistrationController>(
        init: controller,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please add name ";
                        }
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please add password";
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.length != 10) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: const InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black))),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          controller.addFormData('Name', nameController.text);
                          controller.addFormData('Email', emailController.text);
                          controller.addFormData(
                              'Password', passwordController.text);
                          controller.addFormData('Phone', phoneController.text);
                          controller.submitForm();
                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 223, 142, 126),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
