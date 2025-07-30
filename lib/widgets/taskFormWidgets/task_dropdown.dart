import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/project_list_provider.dart';

class TaskDropdown extends ConsumerWidget {
  final String? selectedDropDownValue;
  final ValueChanged<String?> onChanged;

  const TaskDropdown({
    super.key,
    required this.selectedDropDownValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      value: selectedDropDownValue,
      decoration: InputDecoration(
        labelText: 'Select Project',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      icon: const Icon(Icons.unfold_more, size: 24),
      validator: (value) => value == null ? 'Please select a project' : null,
      items: ref.watch(projectListProvider).map<DropdownMenuItem<String>>((
        project,
      ) {
        return DropdownMenuItem<String>(
          value: project.id,
          child: Text(project.name),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
