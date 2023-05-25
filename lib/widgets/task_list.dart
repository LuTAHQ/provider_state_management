import 'package:flutter/material.dart';
import 'package:state_management_provider/models/task.dart';
import 'package:state_management_provider/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Buy Milk', isDone: false),
    Task(name: 'Buy Data', isDone: false),
    Task(name: 'Buy Water', isDone: false),
    Task(name: 'Buy Water', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            toggleCheckboxState: (bool) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
