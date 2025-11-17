import 'package:chart_project/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Scatter extends StatefulWidget {
  final List<DeveloperData> data;
  const Scatter({super.key, required this.data});

  @override
  State<Scatter> createState() => _ScatterState();
}

class _ScatterState extends State<Scatter> {
  //  Property
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scatter')),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text:
                  'Yealy Growth in the Flutter Community',
            ),
            tooltipBehavior: tooltipBehavior,
            series: [
              ScatterSeries<DeveloperData, int>(
                name: 'Site 수',
                dataSource: widget.data,
                xValueMapper:
                    (DeveloperData developers, _) =>
                        developers.year,
                yValueMapper:
                    (DeveloperData developers, _) =>
                        developers.developers,
                enableTooltip: true,
              ),
            ],
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
            ),
          ),
        ),
      ),
    );
  }
}
