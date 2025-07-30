import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/screens/project_overview_screen.dart';
import 'package:flutter_time_tracker/screens/task_log_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen = const ProjectOverviewScreen();
  int currentIndex = 0;
  void _selectedScreen(BuildContext context, int index) {
    if (index == 1) {
      setState(() {
        currentIndex = index;
        currentScreen = const TaskLogScreen();
      });
    }
    if (index == 0) {
      setState(() {
        currentIndex = index;
        currentScreen = const ProjectOverviewScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChronoTracker')),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _selectedScreen(context, index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open_rounded),
            label: 'Projects',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
        ],
      ),
      body: currentScreen,
    );
  }
}
