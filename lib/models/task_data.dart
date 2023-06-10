import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:state_management_provider/models/task.dart';
import 'package:state_management_provider/models/task1.dart';

class TaskData extends ChangeNotifier {
  final String taskHiveBox = 'task-box';

  List<Task1> _tasks1 = [
    Task1(name: 'Going out', isDone: false),
  ];
  // UnmodifiableListView<Task1> get tasks1 => UnmodifiableListView(_tasks1);

  List<Task1> get tasks1 => _tasks1;

  int get taskCount => tasks1.length;
  ////////////

  // Create new task
  Future<void> createItem(String newTaskTitle) async {
    Box<Task1> box = await Hive.openBox<Task1>(taskHiveBox);
    final task = Task1(name: newTaskTitle, isDone: false);
    _tasks1.add(task);
    await box.add(task);

    _tasks1 = box.values.toList();
    notifyListeners();
  }

  // Get notes
  Future<void> getItems() async {
    Box<Task1> box = await Hive.openBox<Task1>(taskHiveBox);
    _tasks1 = box.values.toList();
    print("values ${box.values.length}");
    notifyListeners();
  }

  void updateTask1(Task1 task) {
    task.toggleDone();
    notifyListeners(); // most importantly
  }

  // remove a note
  Future<void> remoteItem(Task1 task1) async {
    Box<Task1> box = await Hive.openBox<Task1>(taskHiveBox);
    await box.delete(task1.key);
    _tasks1 = box.values.toList();
    notifyListeners();
  }

///////////////////////////////

  final List<Task> _tasks = [
    Task(name: 'Buy Milk', isDone: false),
    Task(name: 'Buy Data', isDone: false),
    Task(name: 'Buy Water', isDone: false),
    Task(name: 'Buy Pizza', isDone: false),
  ];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners(); // most importantly
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners(); // most importantly
  }
}
