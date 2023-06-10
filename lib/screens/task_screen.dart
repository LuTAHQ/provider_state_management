import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/screens/add_task_screen.dart';
import 'package:state_management_provider/widgets/task_list.dart';

import '../models/task_data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Box<String>? tasksBox;
  TaskData taskData = TaskData();

  @override
  void initState() {
    super.initState();
    // tasksBox = Hive.box("task-box");
    taskData.getItems();
    // print("value ${tasksBox!.values.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 45,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Todo App",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text("${Provider.of<TaskData>(context).taskCount} Tasks",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 300,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Consumer<TaskData>(
                  builder: (context, taskData, Widget? child) {
                    return ListView.builder(
                      itemBuilder: (BuildContext context, index) {
                        final task = taskData.tasks1[index];
                        return TaskList(
                          name: task.name,
                          isDone: task.isDone,
                        );
                      },
                      itemCount: taskData.taskCount,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddTaskScreen());
          }),
    );
  }
}
