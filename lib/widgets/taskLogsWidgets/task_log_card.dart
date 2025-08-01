import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskLogCard extends StatelessWidget {
  static final dateformater = DateFormat.yMd();
  final String taskName;
  final String ofProject;
  final Duration timeTaken;
  final DateTime date;
  final String? description;
  const TaskLogCard({
    super.key,
    required this.taskName,
    required this.ofProject,
    required this.timeTaken,
    required this.date,
    this.description,
  });

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '$hours hours $minutes minutes';
    } else if (hours > 0) {
      return '$hours hours';
    } else if (minutes > 0) {
      return '$minutes minutes';
    } else {
      return '0 minutes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                taskName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ofProject),
                  Text(
                    '${_formatDuration(timeTaken)} on ${dateformater.format(date)}',
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.description_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
