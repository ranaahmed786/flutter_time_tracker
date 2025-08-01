import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/theme_mode_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: SwitchListTile(
        title: const Text('Dark Mode'),
        subtitle: const Text(
          'Enable Dark Mode for a better viewing experience in low light conditions.',
        ),
        value: isDarkMode,
        onChanged: (value) {
          ref.read(themeModeProvider.notifier).toggleTheme();
        },
      ),
    );
  }
}
