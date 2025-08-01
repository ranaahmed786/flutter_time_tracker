import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/project_list_provider.dart';
import 'package:flutter_time_tracker/providers/tasks_list_provider.dart';
import 'package:flutter_time_tracker/widgets/chart/stats.dart';

class ProjectOverviewStats extends ConsumerWidget {
  const ProjectOverviewStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime startDuration = DateTime.now().subtract(
      const Duration(days: 30),
    );
    final DateTime endDuration = DateTime.now();
    final tasksData = ref.watch(taskListProvider);
    final projectChartMappingList = ref.watch(projectListProvider);
    return Stats(
      startDuration: startDuration,
      endDuration: endDuration,
      tasksData: tasksData,
      projectChartMappingList: projectChartMappingList,
      title: 'Time Distribution',
    );
  }
}
