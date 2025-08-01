import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/tasks_list_provider.dart';
import 'package:flutter_time_tracker/widgets/chart/stats.dart';

class TaskLogsStats extends ConsumerWidget {
  const TaskLogsStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime startDuration = DateTime.now().subtract(
      const Duration(days: 7),
    );
    final DateTime endDuration = DateTime.now();
    final tasksData = ref.watch(taskListProvider);
    return Stats(
      startDuration: startDuration,
      endDuration: endDuration,
      tasksData: tasksData,
      title: 'Time Spent',
    );
  }
}
