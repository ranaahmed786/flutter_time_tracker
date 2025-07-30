import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/project.dart';
import 'package:flutter_time_tracker/providers/project_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectAddingDialog extends ConsumerStatefulWidget {
  const ProjectAddingDialog({super.key});
  @override
  ConsumerState<ProjectAddingDialog> createState() =>
      _ProjectAddingDialogState();
}

class _ProjectAddingDialogState extends ConsumerState<ProjectAddingDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Project'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a project name';
                }
                return null;
              },
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Project Name'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState!.save();
              ref
                  .read(projectListProvider.notifier)
                  .addProject(Project(name: _titleController.text.trim()));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
