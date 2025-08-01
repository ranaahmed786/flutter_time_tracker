import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/tasks_list_provider.dart';
import 'package:flutter_time_tracker/widgets/taskLogsWidgets/task_log_card.dart';

class TasksList extends ConsumerWidget {
  const TasksList({super.key});
  Widget content(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks available.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: ValueKey(task.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              ref.read(taskListProvider.notifier).removeTask(task.id);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${task.name} removed'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      ref.read(taskListProvider.notifier).addTask(task);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${task.name} added back')),
                      );
                    },
                  ),
                ),
              );
            },
            child: TaskLogCard(
              taskName: task.name,
              ofProject: task.ofProject,
              timeTaken: task.duration,
              date: task.date,
              description: task.description ?? 'No description provided',
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return content(context, ref);
  }
}
