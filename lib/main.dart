import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxpractice/screens/counter.dart';
import 'package:getxpractice/screens/display.dart';
import 'package:getxpractice/screens/form.dart';
import 'package:getxpractice/screens/home_page.dart';
import 'package:getxpractice/screens/languages.dart';
import 'package:getxpractice/screens/posts.dart';
import 'package:getxpractice/screens/screen_one.dart';
import 'package:getxpractice/screens/todo_list.dart';
import 'package:getxpractice/screens/translations.dart';

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
            transition: Transition.leftToRight),
        GetPage(
            name: '/Counter',
            page: () => Counter(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/Translation',
            page: () => Translation(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/Posts',
            page: () => Posts(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/Form',
            page: () => RegistrationForm(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/success',
            page: () => SuccessPage(),
            transition: Transition.rightToLeft)
      ],
    );
  }
}
