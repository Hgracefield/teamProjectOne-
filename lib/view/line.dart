import 'package:chart_project/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Line extends StatefulWidget {
  final List<DeveloperData>get;
  const Line({super.key , required this.get});

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
// Property
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Yearly Growth in the Flutter Community \n\n' 
            ),
            tooltipBehavior: TooltipBehavior(),
            series: [
              LineSeries<DeveloperData, int>(
                name: 'Site수',
                dataSource: widget.get,
                xValueMapper: (DeveloperData developers, _) => developers.year, 
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                ),
            ],
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: "년도"),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: "사이트 수"),
              ),
          ),
        ),
      ),
    );
  }
}