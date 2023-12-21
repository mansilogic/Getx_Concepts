import 'package:get/get.dart';
import 'package:getxpractice/model/todo_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[];

  void addTask(String title) {
    tasks.add(Task(title: title));
    update();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    update();
  }
}
