// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxpractice/ui/languages.dart';

class Translation extends StatelessWidget {
  const Translation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Translation'),
          backgroundColor: const Color.fromARGB(255, 229, 161, 140),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'message'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('en', 'US'));
                  },
                  child: Text('english')),
              SizedBox(
                width: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('hi', 'IN'));
                  },
                  child: Text('Hindi'))
            ],
          ),
        ));
  }
}
