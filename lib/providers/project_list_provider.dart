import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/models/project.dart';

final dummyProjects = [
  Project(name: 'Project A'),
  Project(name: 'Project B'),
  Project(name: 'Project C'),
  Project(name: 'Project D'),
];

class ProjectListNotifier extends StateNotifier<List<Project>> {
  ProjectListNotifier() : super(dummyProjects);

  void addProject(Project project) {
    state = [...state, project];
  }

  void removeProject(String id) {
    state = state.where((project) => project.id != id).toList();
  }

  void updateProjectTime(String id, Duration time) {
    state = state.map((project) {
      if (project.id == id) {
        return project.copyWith(totalTimeSpending: time);
      }
      return project;
    }).toList();
  }
}

final projectListProvider =
    StateNotifierProvider<ProjectListNotifier, List<Project>>((ref) {
      return ProjectListNotifier();
    });
