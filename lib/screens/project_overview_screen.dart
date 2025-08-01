import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/widgets/bottom_adding_button.dart';
import 'package:flutter_time_tracker/widgets/projectOverviewWidgets/project_overview_stats.dart';
import 'package:flutter_time_tracker/widgets/projectOverviewWidgets/project_adding_dialog.dart';
import 'package:flutter_time_tracker/widgets/projectOverviewWidgets/project_lists.dart';

class ProjectOverviewScreen extends StatelessWidget {
  void _onAddProject(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ProjectAddingDialog();
      },
    );
  }

  const ProjectOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ProjectOverviewStats(),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Projects',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ProjectLists(),
          SizedBox(height: 8),
          const Spacer(),
          BottomAddingButton(
            onPressed: () {
              _onAddProject(context);
            },
            label: 'Add a new project',
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
