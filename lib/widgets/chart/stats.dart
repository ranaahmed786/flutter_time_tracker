import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/project.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/widgets/chart/chart.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
    required this.startDuration,
    required this.endDuration,
    required this.tasksData,
    this.projectChartMappingList,
    required this.title,
  });
  final DateTime startDuration;
  final DateTime endDuration;
  final List<Task> tasksData;
  final List<Project>? projectChartMappingList;
  final String title;

  List<Task> _getTasksBetween(DateTime start, DateTime end) {
    return tasksData
        .where((task) => task.date.isAfter(start) && task.date.isBefore(end))
        .toList();
  }

  int _getTotalTimeForRange({DateTime? start, DateTime? end}) {
    start ??= startDuration;
    end ??= endDuration;
    final filteredTasks = _getTasksBetween(start, end);
    return getTotalTimeTasks(filteredTasks);
  }

  int getTotalTimeTasks(List<Task> tasks) {
    return tasks.fold(0, (total, task) => total + task.duration.inMinutes);
  }

  int get totalHours {
    return (_getTotalTimeForRange() / 60).floor();
  }

  int get totalMinutes {
    return (_getTotalTimeForRange() % 60).floor();
  }

  // Getter for last 30 days change percentage
  double get lastDaysChangePercent {
    final now = DateTime.now();
    final last30Days = now.subtract(const Duration(days: 30));
    final previous30Days = now.subtract(const Duration(days: 60));

    final currentTotal = _getTotalTimeForRange(start: last30Days, end: now);
    final previousTotal = _getTotalTimeForRange(
      start: previous30Days,
      end: last30Days,
    );

    if (previousTotal == 0) return 0;
    return ((currentTotal - previousTotal) / previousTotal) * 100;
  }

  // Getter for formatted string
  String lastDaysChangeText() {
    final percent = lastDaysChangePercent;
    if (percent == 0) return 'No previous data';
    return 'Last ${endDuration.difference(startDuration).inDays} days ${percent > 0 ? '+' : '-'}${percent.abs().toStringAsFixed(1)}%';
  }

  List<BarChartDataItem> get getChartData {
    final List<BarChartDataItem> chartData = [];
    if (projectChartMappingList != null) {
      for (final project in projectChartMappingList!) {
        chartData.add(
          BarChartDataItem(
            title: project.name,
            fillFactor: project.totalTimeSpending.inHours.toDouble(),
          ),
        );
      }
    } else {
      for (final task in tasksData) {
        chartData.add(
          BarChartDataItem(
            title: task.name,
            fillFactor: task.duration.inHours.toDouble(),
          ),
        );
      }
    }
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${totalHours}h ${totalMinutes}m',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lastDaysChangeText(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: (lastDaysChangePercent >= 0) ? Colors.green : Colors.red,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: CustomBarChart(data: getChartData)),
        ],
      ),
    );
  }
}
