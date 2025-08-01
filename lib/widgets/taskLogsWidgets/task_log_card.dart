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

  void onPressed(BuildContext context) {
    // Handle the onPressed action, e.g., show a dialog with task details
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(taskName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project: $ofProject',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Time Taken: ${_formatDuration(timeTaken)}',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Date: ${dateformater.format(date)}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Description: $description',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
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
            onPressed: () => onPressed(context),
          ),
        ],
      ),
    );
  }
}
