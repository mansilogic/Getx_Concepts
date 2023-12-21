import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controller/todo_controller.dart';

class ToDoList extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<TaskController>(
              builder: (taskController) => ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  var task = taskController.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        taskController.removeTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String newTask = textController.text;
                    if (newTask.isNotEmpty) {
                      taskController.addTask(newTask);
                      textController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
