import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/widgets/projectOverviewWidgets/project_list_card.dart';
import 'package:flutter_time_tracker/providers/project_list_provider.dart';
import 'package:flutter_time_tracker/models/project.dart';

class ProjectLists extends ConsumerStatefulWidget {
  const ProjectLists({super.key});

  @override
  ConsumerState<ProjectLists> createState() => _ProjectListsState();
}

class _ProjectListsState extends ConsumerState<ProjectLists> {
  void undoDismiss(Project project) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${project.name} removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('${project.name} restored')));
            ref.read(projectListProvider.notifier).addProject(project);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectListProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(projects[index].id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              ref
                  .read(projectListProvider.notifier)
                  .removeProject(projects[index].id);
              undoDismiss(projects[index]);
            },
            child: ProjectListCard(project: projects[index]),
          );
        },
      ),
    );
  }
}
