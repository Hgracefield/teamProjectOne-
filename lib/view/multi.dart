import 'package:chart_project/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Multi extends StatefulWidget {
  const Multi({super.key});

  @override
  State<Multi> createState() => _MultiState();
}

class _MultiState extends State<Multi> {
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
                dataSource: data2,
                xValueMapper: (DeveloperData developers, _) =>
                    developers.year,
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
              ColumnSeries<DeveloperData, int>(
                name: 'site수',
                dataSource: data2,
                xValueMapper: (DeveloperData developers, _) =>
                    developers.year,
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),

                enableTooltip: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
