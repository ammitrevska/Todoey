import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
        itemBuilder: (context, index) {
          final displayedTask = taskData.task[index];
          return TaskTile(
            isChecked: displayedTask.isDone,
            taskTitle: displayedTask.name,
            checkBoxCallBack:  (bool? newValue) {
              taskData.updateTask(displayedTask);
          },
          longPressCallBack: () {
            taskData.deleteTask(displayedTask);
          },
          );
        },
        itemCount: taskData.taskCount,
      );
      },
    );
  }
}
