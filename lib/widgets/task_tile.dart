import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.toggleCheckboxState,
    required this.longPressCallback
  });

  final bool isChecked; 
  final String taskTitle;
  final void Function(bool?)? toggleCheckboxState;
  final void Function()? longPressCallback;

  // void toggleCheckboxState(bool? toggleCheckboxState) {
  //   setState(() {
  //     isChecked = toggleCheckboxState!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        checkColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleCheckboxState,
        
      ),
    );
  }
}