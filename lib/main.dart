import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/models/task_data.dart';

import 'models/task.dart';
import 'models/task1.dart';
import 'screens/task_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Task>('tasksBox');
  // Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(Task1Adapter());

  runApp(const MyApp());

  Hive.close();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TaskData taskData = TaskData();
  @override
  void initState() {
    super.initState();
    print("initState main");
    
  }


// Box<Task> todosBox;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
