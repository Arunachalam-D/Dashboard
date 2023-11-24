import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final List<ChartData> chartData = [
    ChartData(
      "1",
      3,
    ),
    ChartData(
      "2",
      2,
    ),
    ChartData(
      "3",
      4,
    ),
    ChartData(
      "4",
      0.5,
    ),
    ChartData(
      "5",
      1,
    ),
    ChartData(
      "6",
      1.5,
    ),
    ChartData(
      "7",
      2,
    ),
    ChartData(
      "8",
      1,
    ),
    ChartData(
      "9",
      2.8,
    ),
    ChartData(
      "10",
      1.5,
    ),
    ChartData(
      "11",
      5,
    ),
    ChartData(
      "12",
      2,
    ),
    ChartData(
      "13",
      1.5,
    ),
    ChartData(
      "14",
      2.5,
    ),
    ChartData(
      "15",
      1,
    ),
    ChartData(
      "16",
      2.5,
    ),
    ChartData(
      "17",
      3.4,
    ),
    ChartData(
      "18",
      0.5,
    ),
    ChartData(
      "19",
      1,
    ),
    ChartData(
      "20",
      5,
    ),
    ChartData(
      "21",
      3.2,
    ),
    ChartData(
      "22",
      2.3,
    ),
    ChartData(
      "23",
      1.2,
    ),
    ChartData(
      "24",
      4,
    ),
    ChartData(
      "25",
      0.5,
    ),
    ChartData(
      "26",
      1,
    ),
    ChartData(
      "27",
      1.5,
    ),
    ChartData(
      "28",
      3,
    ),
    ChartData(
      "29",
      1,
    ),
    ChartData(
      "30",
      2.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: [
              StackedColumnSeries(
                dataSource: chartData,
                xValueMapper: (ChartData ch, _) => ch.x,
                yValueMapper: (ChartData ch, _) => ch.y1,
                width: 0.3,
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.orange, //(0xFF8A2387)
                      Color(0xFFE94057),
                      Colors.indigo //(0xFFE94057)
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y1;

  ChartData(this.x, this.y1);
}
