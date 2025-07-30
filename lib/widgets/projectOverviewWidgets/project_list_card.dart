import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/project.dart';

class ProjectListCard extends StatelessWidget {
  const ProjectListCard({super.key, required this.project});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          project.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Total Time: ${project.totalTimeSpending.inHours} hours',
        ),
        trailing: Text('Created At: ${project.createdAt}'),
      ),
    );
  }
}
