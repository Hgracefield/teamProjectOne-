import 'package:chart_project/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  final List<DeveloperData> data;

  const Pie({super.key, required this.data});

  @override
  State<Pie> createState() => PieState();
}

class PieState extends State<Pie> with TickerProviderStateMixin {
  //tabbar
  //property

  late TooltipBehavior tooltipBehavior;
  late TabController controller;

  @override //한번만 실행
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true); //숫자보이게
    //controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); // 앱바 종료시 dispose 로 종료를 시켜줘야 함.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
        centerTitle: false,
        foregroundColor: Colors.black,
      ),
      body: SizedBox(
        width: 380,
        height: 600,
        child: SfCircularChart(
          title: ChartTitle(
            text: 'Yearly Growth in the Flutter Community',
            alignment: ChartAlignment.center,
          ),
          tooltipBehavior: tooltipBehavior, //클릭시 정보나옴
          legend: Legend(),
          series: <CircularSeries<DeveloperData, int>>[
            PieSeries<DeveloperData, int>(
              name: 'sites',
              dataSource: widget.data,
              explode: true,
              selectionBehavior: SelectionBehavior(enable: true),
              xValueMapper: (DeveloperData developers, _) =>
                  developers.year,
              yValueMapper: (DeveloperData developers, _) =>
                  developers.developers,
              dataLabelSettings: DataLabelSettings(
                isVisible: true, //차트는 숫자보이게 신뢰도 상승
              ),
              enableTooltip: true,
            ),
          ],
          //X축을 category형식으로 표현:문자
        ),
      ),
    );
  }
}
