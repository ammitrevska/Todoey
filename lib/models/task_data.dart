import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier{
    final List<Task> _tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy bread'),
    Task(name: 'buy fill'),
  ];

  int get taskCount{
    return _tasks.length;
  }

  void addATask(String taskTitle){
    final task = Task(name: taskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}