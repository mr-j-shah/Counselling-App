import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/StatisticsScreen/controller/StatisticsController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StatisticsController controller = Get.put(StatisticsController());

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Statistics"),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.sessions.isEmpty) {
                    return const Center(
                        child: AppText(text: "No data available."));
                  }
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(Dimensions.padding(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummaryCards(controller),
                        SizedBox(height: Dimensions.height(24)),
                        _buildSessionChart(controller),
                        SizedBox(height: Dimensions.height(24)),
                        _buildMoodChart(controller),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCards(StatisticsController controller) {
    return Row(
      children: [
        Expanded(
            child: _buildSummaryCard("Total Sessions",
                controller.totalSessions.value.toString())),
        SizedBox(width: Dimensions.width(12)),
        Expanded(
            child: _buildSummaryCard(
                "Total Time", "${controller.totalTime.value} min")),
        SizedBox(width: Dimensions.width(12)),
        Expanded(
          child: _buildSummaryCard("Avg. Mood Boost",
              "+${controller.avgMoodImprovement.value.toStringAsFixed(1)}"),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius(12))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding(8),
            vertical: Dimensions.padding(16)),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Dimensions.font(13), color: Colors.grey.shade600),
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
                text: value,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor),
          ],
        ),
      ),
    );
  }

  Widget getBarTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1: text = 'Mon'; break;
      case 2: text = 'Tue'; break;
      case 3: text = 'Wed'; break;
      case 4: text = 'Thu'; break;
      case 5: text = 'Fri'; break;
      case 6: text = 'Sat'; break;
      case 7: text = 'Sun'; break;
      default: text = ''; break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
  }

  Widget _buildSessionChart(StatisticsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
            text: "Weekly Summary (minutes)",
            fontSize: 18,
            fontWeight: FontWeight.bold),
        SizedBox(height: Dimensions.height(16)),
        SizedBox(
          height: Dimensions.height(200),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: controller.weeklyChartData.entries.map((entry) {
                return BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value,
                      gradient: LinearGradient(
                        colors: [primaryColor, primaryColor.withOpacity(0.5)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getBarTitles,
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                       if (value == meta.max || value == 0) {
                         return const SizedBox();
                       }
                      return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                    }
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 5,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.4,
                    dashArray: [4, 4],
                  );
                },
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMoodChart(StatisticsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
            text: "Mood Tracking", fontSize: 18, fontWeight: FontWeight.bold),
        SizedBox(height: Dimensions.height(16)),
        SizedBox(
          height: Dimensions.height(200),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                 horizontalInterval: 2,
                 getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.4,
                    dashArray: [4, 4],
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: controller.sessions.map((session) {
                    return FlSpot(session.timestamp.millisecondsSinceEpoch.toDouble(),
                        session.preMood.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: Colors.blueAccent,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: true, color: Colors.blueAccent.withOpacity(0.2)),
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: controller.sessions.map((session) {
                    return FlSpot(session.timestamp.millisecondsSinceEpoch.toDouble(),
                        session.postMood.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: Colors.greenAccent,
                  barWidth: 3,
                   isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: true, color: Colors.greenAccent.withOpacity(0.2)),
                  dotData: const FlDotData(show: false),
                ),
              ],
               titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 2,
                       getTitlesWidget: (value, meta) =>
                        Text(value.toInt().toString(), style: const TextStyle(fontSize: 12)),
                      )
                    ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: const Duration(days: 2).inMilliseconds.toDouble(),
                    getTitlesWidget: (value, meta) {
                      final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8.0,
                        child: Text(DateFormat.MMMd().format(date), style: const TextStyle(fontSize: 12)),
                      );
                    }
                  )
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height(16)),
        _buildLegend(),
      ],
    );
  }

   Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(Colors.blueAccent, "Pre-Session Mood"),
        SizedBox(width: Dimensions.width(20)),
        _buildLegendItem(Colors.greenAccent, "Post-Session Mood"),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: Dimensions.width(8)),
        AppText(text: text, fontSize: 14),
      ],
    );
  }
}
