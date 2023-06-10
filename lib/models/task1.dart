import 'package:hive_flutter/adapters.dart';
import 'package:state_management_provider/models/task.dart';

import 'package:hive/hive.dart';
part 'task1.g.dart';
@HiveType(typeId: 0)
class Task1 extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isDone = false;
 
  Task1({ 
    required this.name,
    required this.isDone,
  });

  dynamic toggleDone() {
    isDone = !isDone;
  }
}
