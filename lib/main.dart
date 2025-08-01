import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/theme_mode_provider.dart';
import 'package:flutter_time_tracker/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'ChronoTracker',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: themeMode,
      home: HomeScreen(),
    );
  }
}

// Light Theme
final _lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.light,
  ),
  fontFamily: 'Inter',
  appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
  cardTheme: CardThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

// Dark Theme
final _darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      ).copyWith(
        // Custom dark theme colors
        primary: const Color(0xFFD0BCFF),
        onPrimary: const Color(0xFF381E72),
        primaryContainer: const Color(0xFF4F378B),
        onPrimaryContainer: const Color(0xFFEADDFF),

        secondary: const Color(0xFFCCC2DC),
        onSecondary: const Color(0xFF332D41),
        secondaryContainer: const Color(0xFF4A4458),
        onSecondaryContainer: const Color(0xFFE8DEF8),

        tertiary: const Color(0xFFEFB8C8),
        onTertiary: const Color(0xFF492532),
        tertiaryContainer: const Color(0xFF633B48),
        onTertiaryContainer: const Color(0xFFFFD8E4),

        error: const Color(0xFFF2B8B5),
        onError: const Color(0xFF601410),
        errorContainer: const Color(0xFF8C1D18),
        onErrorContainer: const Color(0xFFF9DEDC),

        surface: const Color(0xFF141218),
        onSurface: const Color(0xFFE6E0E9),
        surfaceContainerHighest: const Color(0xFF49454F),
        onSurfaceVariant: const Color(0xFFCAC4D0),

        outline: const Color(0xFF938F99),
        outlineVariant: const Color(0xFF49454F),
      ),
  fontFamily: 'Inter',

  // AppBar styling
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Color(0xFF1D1B20),
    foregroundColor: Color(0xFFE6E0E9),
    surfaceTintColor: Colors.transparent,
  ),

  // Card styling
  cardTheme: CardThemeData(
    elevation: 3,
    shadowColor: Colors.black.withAlpha(120),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: const Color(0xFF1D1B20),
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1D1B20),
    selectedItemColor: Color(0xFFD0BCFF),
    unselectedItemColor: Color(0xFF938F99),
    elevation: 8,
  ),

  // Input decoration (TextFormField)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1D1B20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF938F99)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF938F99)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFD0BCFF), width: 2),
    ),
    labelStyle: const TextStyle(color: Color(0xFFCAC4D0)),
    hintStyle: const TextStyle(color: Color(0xFF938F99)),
  ),

  // Elevated Button styling
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6750A4),
      foregroundColor: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  // FloatingActionButton styling
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF6750A4),
    foregroundColor: Color(0xFFFFFFFF),
  ),

  // Snackbar styling
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF332D41),
    contentTextStyle: TextStyle(color: Color(0xFFE6E0E9)),
    actionTextColor: Color(0xFFD0BCFF),
  ),

  // Drawer styling
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF141218)),
);
