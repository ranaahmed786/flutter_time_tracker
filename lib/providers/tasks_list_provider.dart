import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/models/task.dart';

final dummyTasks = [
  Task(
    name: 'Task 1',
    projectID: 'Project A',
    duration: const Duration(hours: 2, minutes: 20),
    date: DateTime.now(),
    ofProject: 'Project A',
    description: 'Description for Task 1',
  ),
  Task(
    name: 'Task 2',
    projectID: 'Project B',
    duration: const Duration(hours: 1, minutes: 45),
    date: DateTime.now(),
    ofProject: 'Project B',
    description: 'Description for Task 2',
  ),
];

class TasksListNotifier extends StateNotifier<List<Task>> {
  TasksListNotifier() : super(dummyTasks);

  void addTask(Task task) {
    state = [...state, task];
  }

  void removeTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }
}

final taskListProvider = StateNotifierProvider<TasksListNotifier, List<Task>>(
  (ref) => TasksListNotifier(),
);
