import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_tracker/providers/taskEntryFormProviders/time_spent_provider.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTimepickers extends ConsumerStatefulWidget {
  const CupertinoTimepickers({super.key});
  @override
  ConsumerState<CupertinoTimepickers> createState() =>
      _CupertinoTimepickersState();
}

class _CupertinoTimepickersState extends ConsumerState<CupertinoTimepickers> {
  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the time provider with default values
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTime();
    });
  }

  void _updateTime() {
    ref
        .read(timeSpentProvider.notifier)
        .setTime(Duration(hours: selectedHour, minutes: selectedMinute));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 160,
          height: 90,
          child: CupertinoPicker(
            itemExtent: 36,
            scrollController: FixedExtentScrollController(
              initialItem: selectedHour,
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedHour = index;
                _updateTime();
              });
            },
            children: [
              for (int i = 0; i <= 24; i++)
                Text('$i', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 160,
          height: 90,
          child: CupertinoPicker(
            itemExtent: 36,
            scrollController: FixedExtentScrollController(
              initialItem: selectedMinute ~/ 15,
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedMinute = index * 15;
                _updateTime();
              });
            },
            children: [
              for (int i = 0; i <= 60; i += 15)
                Text('$i', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
