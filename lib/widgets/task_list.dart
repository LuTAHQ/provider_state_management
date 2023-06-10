import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/models/task_data.dart';
import 'package:state_management_provider/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key, required this.name, required this.isDone,
  });

  final String name;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return TaskTile(
      taskTitle: name,
      isChecked: isDone,
      toggleCheckboxState: (bool) {
        // taskData.updateTask(task);
        // taskData.updateTask1(task);
      },
      longPressCallback: () {
        // taskData.deleteTask(task);
        // taskData.remoteItem(task);
      },
    );
  }
}




  // return  Consumer<TaskData>(
  //     builder: (context, taskData, Widget? child) {
  //       return ListView.builder(
  //         itemBuilder: (BuildContext context, index) {
  //           final task = taskData.tasks1[index];
  //           return TaskTile(
  //             taskTitle: task.name,
  //             isChecked: task.isDone,
  //             toggleCheckboxState: (bool) {
  //               // taskData.updateTask(task);
  //               taskData.updateTask1(task);
  //             },
  //             longPressCallback: () {
  //               // taskData.deleteTask(task);
  //               taskData.remoteItem(task);
  //             },
  //           );
  //         },
  //         itemCount: taskData.taskCount,
  //       );
  //     },
  //   );