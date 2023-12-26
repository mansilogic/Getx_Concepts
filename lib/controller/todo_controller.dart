import 'package:get/get.dart';
import 'package:getxpractice/models/todo_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[];
  int num = 1;

  void addTask(String title) {
    tasks.add(Task(title: title));
    update();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    update();
  }
}
