import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart extends StatelessWidget {
  final List<BarChartDataItem> data;

  const CustomBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY:
            data.map((e) => e.fillFactor).reduce((a, b) => a > b ? a : b) * 1.2,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index < 0 || index >= data.length) return Container();
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width / (data.length * 1.5),
                    child: Text(
                      textAlign: TextAlign.center,
                      data[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          data.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: data[index].fillFactor,
                color: Colors.grey[300],
                width: MediaQuery.of(context).size.width / (data.length * 1.5),
                borderRadius: BorderRadius.circular(0),
                rodStackItems: [
                  BarChartRodStackItem(
                    data[index].fillFactor -
                        data[index].fillFactor *
                            0.1, // fill up to just below the top
                    data[index].fillFactor, // minor top border
                    Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BarChartDataItem {
  final String title;
  final double fillFactor;

  BarChartDataItem({required this.title, required this.fillFactor});
}
