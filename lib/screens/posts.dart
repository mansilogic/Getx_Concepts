// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxpractice/controller/api/post_controller.dart';

class Posts extends StatelessWidget {
  TodoController todoController = Get.put(TodoController());
  TextEditingController todotext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do With API'),
          backgroundColor: const Color.fromARGB(255, 229, 161, 140),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return Obx(() => Column(
                      children: todoController.ToDoList.map((e) => Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 226, 181, 167),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.id.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                e.title.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 8, 8),
                                    fontSize: 18),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                            title: 'Do You Want To Delele',
                                            content: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    OutlinedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text('No')),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    OutlinedButton(
                                                        onPressed: () {
                                                          todoController
                                                              .deleteTodo(e.id);
                                                          Get.back();
                                                        },
                                                        child: Text('Yes'))
                                                  ],
                                                )
                                              ],
                                            ));
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              ),
                            ],
                          ))).toList(),
                    ));
              },
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'enter task',
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: todotext,
                          decoration: InputDecoration(hintText: 'Enter Task'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Cancle')),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            todoController.postTodos(todotext.text);
                            Get.back();
                            todotext.clear();
                          },
                          child: Text('Save'))
                    ],
                  )
                ],
              ),
            );
          },
          backgroundColor: Color.fromARGB(255, 206, 148, 130),
          child: Icon(Icons.add),
        ));
  }
}
