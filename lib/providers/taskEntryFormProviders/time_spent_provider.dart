import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSpentNotifier extends StateNotifier<Duration> {
  TimeSpentNotifier() : super(Duration.zero);

  void addTime(Duration duration) {
    state += duration;
  }

  void setTime(Duration duration) {
    state = duration;
  }

  void resetTime() {
    state = Duration.zero;
  }
}

final timeSpentProvider = StateNotifierProvider<TimeSpentNotifier, Duration>(
  (ref) => TimeSpentNotifier(),
);
