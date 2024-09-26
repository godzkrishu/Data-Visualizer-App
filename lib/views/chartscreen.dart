import 'package:flchart/models/roaddata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../controllers/fetchdata.dart'; // Import the provider from fetchdata.dart

class ChartScreen extends ConsumerWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the road data
    ref.watch(fetchRoadDataProvider.notifier).fetchRoadData();
    // Watch the roadDataProvider
    final roadDataList = ref.watch(fetchRoadDataProvider);

    final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      zoomMode: ZoomMode.xy,
      enableDoubleTapZooming: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Chart Screen",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.yellow[100],
      ),
      body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(30),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Pradhan Mantri Gram Sadak Yojna (PMGSY) Data",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 500,
                  child: SfCartesianChart(
                    primaryXAxis: NumericAxis(
                      title: AxisTitle(text: 'Various States of India'),
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(text: 'Road Length Assigned vs Completed in Km'),
                    ),
                    legend: Legend(isVisible: true),
                    zoomPanBehavior: _zoomPanBehavior,
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: '',
                      format: 'point.x: point.y\nState: point.state',
                    ),
                    onTooltipRender: (TooltipArgs args) {
                      final int pointIndex = (args.pointIndex ?? 0).toInt();
                      final String stateName = roadDataList[pointIndex].stateName;
                      args.text = 'State: $stateName\n'
                          'Assigned: ${roadDataList[pointIndex].roadlengthSanctioned}\n'
                          'Completed: ${roadDataList[pointIndex].roadlengthCompleted}\n'
                          'Difference: ${(roadDataList[pointIndex].roadlengthSanctioned - roadDataList[pointIndex].roadlengthCompleted).abs()}\n'
                          'Expenditure(Lakh): ${(roadDataList[pointIndex].expenditureInLakhs)}';
                    },
                    series: <CartesianSeries<RoadData, double>>[
                      LineSeries<RoadData, double>(
                        name: "Len. Road Completed Km",
                        color: Colors.blue,
                        width: 5,
                        dataSource: roadDataList,
                        xValueMapper: (RoadData data, int index) => index + 1.0,
                        yValueMapper: (RoadData data, _) => data.roadlengthCompleted,
                        dataLabelMapper: (RoadData data, _) => data.stateName,
                        markerSettings: MarkerSettings(isVisible: true),
                      ),
                      LineSeries<RoadData, double>(
                        name: "Len. Road Assigned Km",
                        color: Colors.red,
                        width: 10,
                        opacity: 0.5,
                        dataSource: roadDataList,
                        xValueMapper: (RoadData data, int index) => index + 1.0,
                        yValueMapper: (RoadData data, _) => data.roadlengthSanctioned,
                        dataLabelMapper: (RoadData data, _) => data.stateName,
                        markerSettings: MarkerSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    "Physical & Financial Progress of Pradhan Mantri Gram Sadak Yojna (PMGSY)",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => launchUrlString(
                      'https://api.data.gov.in/resource/d4361151-6d41-43c7-98cd-9a6cd90b5ca4?api-key=579b464db66ec23bdd0000012b16201eddcf4af86447cced80cdb287&format=json&limit=100'),
                  child: const Text("Data Source: data.gov.in (click)"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("Go BACK"),
                ),
              ],
            ),
          )
    );

  }
}
