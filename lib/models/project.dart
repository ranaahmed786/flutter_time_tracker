import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormater = DateFormat.yMd();

class Project {
  final String id;
  final String name;
  final Duration totalTimeSpending;
  final String createdAt;

  Project({
    String? id,
    required this.name,
    Duration? totalTimeSpending,
    String? createdAt,
  }) : id = id ?? const Uuid().v4(),
       totalTimeSpending = totalTimeSpending ?? Duration.zero,
       createdAt = createdAt ?? dateFormater.format(DateTime.now());

  Project copyWith({
    String? id,
    String? name,
    Duration? totalTimeSpending,
    String? createdAt,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      totalTimeSpending: totalTimeSpending ?? this.totalTimeSpending,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
