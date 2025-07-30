import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String name;
  final String projectID;
  final Duration duration;
  final DateTime date;
  final String? description;
  final String ofProject;
  Task({
    required this.name,
    required this.projectID,
    required this.duration,
    required this.ofProject,
    required this.date,
    this.description,
  }) : id = Uuid().v4();
}
