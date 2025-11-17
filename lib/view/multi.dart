import 'package:chart_project/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultiLine extends StatefulWidget {
  final List<DeveloperData> data;
  final List<DeveloperData> data2;
  const MultiLine({
    super.key,

    required this.data,
    required this.data2,
  });

  @override
  State<MultiLine> createState() => _MultiLineState();
}

class _MultiLineState extends State<MultiLine> {
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;
  late List<DeveloperData> data2;

  @override
  void initState() {
    super.initState();
    data = [];
    data2 = [];
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi Lines')),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Yearly Growth in the Flutter Community\n\n',
            ),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),
            series: [
              LineSeries<DeveloperData, int>(
                name: 'site수',
                dataSource: data,
                xValueMapper: (DeveloperData developers, _) =>
                    developers.year,
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                color: Colors.indigo,
              ),
              LineSeries<DeveloperData, int>(
                name: 'site수',
                dataSource: widget.data,
                xValueMapper: (DeveloperData developers, _) =>
                    developers.year,
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
              ColumnSeries<DeveloperData, int>(
                name: 'site수',
                dataSource: widget.data2,
                xValueMapper: (DeveloperData developers, _) =>
                    developers.year,
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),

                enableTooltip: true,
              ),
            ],
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              majorGridLines: const MajorGridLines(width: 18),
            ),

            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
              labelStyle: TextStyle(color: Colors.black),
              axisLine: const AxisLine(width: 10),
            ),
          ),
        ),
      ),
    );
  }
}
