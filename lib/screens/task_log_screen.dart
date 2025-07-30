import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/widgets/bottom_adding_button.dart';
import 'package:flutter_time_tracker/widgets/taskLogsWidgets/tasks_list.dart';
import 'package:flutter_time_tracker/screens/new_task_screen.dart';

class TaskLogScreen extends ConsumerStatefulWidget {
  const TaskLogScreen({super.key});

  @override
  ConsumerState<TaskLogScreen> createState() => _TaskLogScreenState();
}

class _TaskLogScreenState extends ConsumerState<TaskLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('chart yahan ayega'),
          const SizedBox(height: 8),
          Text(
            'Task Logs',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          const Expanded(child: TasksList()),
          const Spacer(),
          BottomAddingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTaskScreen()),
              );
            },
            label: 'Add Task Log',
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
