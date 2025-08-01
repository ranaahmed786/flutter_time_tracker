import 'package:uuid/uuid.dart';

class Project {
  final String id;
  final String name;
  final Duration totalTimeSpending;
  final DateTime createdAt;

  Project({
    String? id,
    required this.name,
    Duration? totalTimeSpending,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       totalTimeSpending = totalTimeSpending ?? Duration.zero,
       createdAt = createdAt ?? DateTime.now();

  Project copyWith({
    String? id,
    String? name,
    Duration? totalTimeSpending,
    DateTime? createdAt,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      totalTimeSpending: totalTimeSpending ?? this.totalTimeSpending,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
