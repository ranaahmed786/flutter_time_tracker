import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Chart extends ConsumerWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Implement your chart widget here
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Time Distribution',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          Text('tame idhr ayega'),
          const SizedBox(height: 16),
          Text('Last 30 days +15%'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('ss')],
          ),
        ],
      ),
    );
  }
}
