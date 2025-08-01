import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/providers/project_list_provider.dart';
import 'package:flutter_time_tracker/providers/taskEntryFormProviders/time_spent_provider.dart';
import 'package:flutter_time_tracker/providers/tasks_list_provider.dart';
import 'package:flutter_time_tracker/widgets/bottom_adding_button.dart';
import 'package:flutter_time_tracker/widgets/taskFormWidgets/task_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_tracker/widgets/taskFormWidgets/cupertino_timepickers.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  const NewTaskScreen({super.key});

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDropDownValue;
  DateTime? _selectedDate;
  final dateFormatter = DateFormat.yMd();
  String? selectedProject;
  String? selectedTaskTitle;
  String? notes;
  void _setSelectedDate() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (_selectedDate != null) {
      setState(() {
        _selectedDate = _selectedDate;
      });
    }
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final projects = ref.read(projectListProvider);
      final time = ref.read(timeSpentProvider);
      final newTask = Task(
        ofProject: projects
            .firstWhere((project) => project.id == _selectedDropDownValue)
            .name,
        date: _selectedDate ?? DateTime.now(),
        projectID: _selectedDropDownValue!,
        description: selectedTaskTitle ?? 'description not provided',
        duration: time,
        name: selectedTaskTitle!,
      );
      ref.read(taskListProvider.notifier).addTask(newTask);
      ref
          .read(projectListProvider.notifier)
          .updateProjectTime(_selectedDropDownValue!, time);
      Navigator.pop(context);
      ref.read(timeSpentProvider.notifier).resetTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Entry')),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - keyboardHeight,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TaskDropdown(
                  selectedDropDownValue: _selectedDropDownValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedDropDownValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  onSaved: (newValue) => selectedTaskTitle = newValue,
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a task name'
                      : null,
                ),
                const SizedBox(height: 16),
                Text(
                  'Time Spent',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                CupertinoTimepickers(),
                const SizedBox(height: 16),
                Text(
                  'Date',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate != null
                            ? dateFormatter.format(_selectedDate!)
                            : 'Select Date',
                        style: const TextStyle(fontSize: 17),
                      ),
                      IconButton(
                        onPressed: _setSelectedDate,
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  onSaved: (newValue) => notes = newValue,
                  decoration: InputDecoration(
                    labelText: 'Notes (Optional)',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                BottomAddingButton(
                  onPressed: _onSubmit,
                  label: 'Add Task',
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
