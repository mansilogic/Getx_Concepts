// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/ui/counter.dart';
import 'package:getxpractice/ui/todo_list.dart';
import 'package:getxpractice/ui/translations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getx exapmle'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('here the dialog alert'),
              onTap: () {
                Get.defaultDialog(
                    title: 'Are you sure?',
                    titlePadding: EdgeInsets.only(top: 10),
                    contentPadding: EdgeInsets.all(20),
                    middleText: 'think twice before delete',
                    confirm: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Confirm')),
                    cancel:
                        TextButton(onPressed: () {}, child: Text('Cancle')));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('here the Bottom sheet for change the theme'),
              onTap: () {
                Get.bottomSheet(Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 229, 161, 140),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.light_mode),
                        title: Text('Light Theme'),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.dark_mode),
                        title: Text('Dark Theme'),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                      ),
                    ],
                  ),
                ));
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('Go to Next Screen'),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Get.toNamed('/ScreenOne',
                    arguments: ['Mansi Parate', 'Manish Parate']);
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('Go to Counter'),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Get.to(Counter());
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('Go to To-Do List'),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Get.to(ToDoList());
              },
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            color: Color.fromARGB(255, 236, 187, 172),
            child: ListTile(
              title: Text('Go to Translation'),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Get.to(Translation());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'click for snackbar',
        child: Icon(Icons.notification_add),
        onPressed: () {
          Get.snackbar('mansi', 'how are you',
              colorText: Colors.black,
              backgroundColor: const Color.fromARGB(255, 236, 190, 190),
              icon: Icon(Icons.notifications_active));
        },
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
    );
  }
}
