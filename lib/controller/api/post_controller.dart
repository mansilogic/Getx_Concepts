// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxpractice/models/post_model.dart';
import 'package:getxpractice/screens/todo_list.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var ToDoList = RxList<ToDoModel>();

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<RxList<ToDoModel>> getTodos() async {
    final response = await http.get(
        Uri.parse("https://658be16b859b3491d3f4f5b6.mockapi.io/api/todolist"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        ToDoList.add(ToDoModel.fromJson(index));
      }
      return ToDoList;
    } else {
      return ToDoList;
    }
  }

  Future<void> postTodos(title) async {
    final response = await http.post(
        Uri.parse("https://658be16b859b3491d3f4f5b6.mockapi.io/api/todolist"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {"title": title},
        ));

    if (response.statusCode == 201) {
      print('Task Added Success.');
      ToDoList.clear();
      getTodos();
    } else {
      print('Task Added Failed.');
    }
  }

  Future<void> deleteTodo(id) async {
    final response = await http.delete(
      Uri.parse("https://658be16b859b3491d3f4f5b6.mockapi.io/api/todolist/$id"),
    );
    if (response.statusCode == 200) {
      print('Task Deleted Success.');
      ToDoList.clear();
      getTodos();
    } else {
      print('Task Not Deleted.');
    }
  }
}
