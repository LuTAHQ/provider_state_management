import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.toggleCheckboxState
  });

  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? toggleCheckboxState;

  // void toggleCheckboxState(bool? toggleCheckboxState) {
  //   setState(() {
  //     isChecked = toggleCheckboxState!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        checkColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleCheckboxState
      ),
    );
  }
}

// (bool? toggleCheckboxState) {
//           setState(() {
//             isChecked = toggleCheckboxState!;
//           });
//         }




/////           ListScreen
///
///
///AddTaskScreen               TaskList
///
///
///
///                             TaskTile
/// 
/// 
///                     checkbox             Text (title of the task)