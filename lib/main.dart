import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxpractice/ui/home_page.dart';
import 'package:getxpractice/ui/languages.dart';
import 'package:getxpractice/ui/screen_one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'getx example',
      fallbackLocale: Locale('en', 'US'),
      locale: Locale('en', 'US'),
      translations: Languages(),
      theme: ThemeData(primaryColor: Color.fromARGB(255, 243, 33, 68)),
      home: const HomePage(),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
            name: '/ScreenOne',
            page: () => ScreenOne(),
            transition: Transition.rightToLeft)
      ],
    );
  }
}
