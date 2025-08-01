import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/models/task.dart';

class TasksListNotifier extends StateNotifier<List<Task>> {
  TasksListNotifier() : super([]);

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
