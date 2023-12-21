import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ScreenOne extends StatefulWidget {
  var name;
  ScreenOne({Key? key, this.name}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One ' + Get.arguments[1]),
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
      body: Container(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Go To Back'),
          )
        ],
      )),
    );
  }
}
