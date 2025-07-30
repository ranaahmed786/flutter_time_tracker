import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'ChronoTracker',
        theme: themeData,
        home: HomeScreen(),
      ),
    );
  }
}

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  fontFamily: 'Inter',
);
