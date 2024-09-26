import 'package:flchart/controllers/fetchdata.dart';
import 'package:flchart/models/roaddata.dart';
import 'package:flchart/models/seekhoKamaouData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SikhoKamaoScreen extends ConsumerWidget {
  const SikhoKamaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //fetch the road data
    ref.watch(fetchSikhoKamaoDataProvider.notifier).fetchSikhoKamaoData();
    //watching Sikho kamao data Provider
     final sikhoKamaoDataList = ref.watch(fetchSikhoKamaoDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 140),
            child: Text(
              "Sikho Kamao Screen",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.yellow[100],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(30),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text("Sikho Kamao Scheme",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:  Colors.black
                  ),
                ),
              ),


              Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        title: AxisTitle(text: 'Candidate Trained under This Scheme '),
                        labelIntersectAction: AxisLabelIntersectAction.trim, // Trim the long labels
                        maximumLabelWidth: 60,  // Set a maximum width for the labels
                      ),
                      primaryYAxis: NumericAxis(
                        title: AxisTitle(text: 'Various state of india'),
                        minimum: 1,

                      ),
                      legend: Legend(isVisible: true),
                      //users can distinguish between the blue and red lines.
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        header: '',
                        format: 'State:point.y\n Trainer:point.x', // Display state name
                      ),
                      onTooltipRender: (TooltipArgs args) {
                        // Get the current data point index
                        final int pointIndex = (args.pointIndex ?? 0).toInt();
                        // Fetch the state name from the corresponding data point
                        final String stateName = sikhoKamaoDataList[pointIndex].stateName;
                        // Customize the tooltip content
                        args.text = 'State: $stateName\n'
                            'Candidate Trained: ${sikhoKamaoDataList[pointIndex].Candidatetrained}\n';
                      },//showing the values when a user hovers or taps on a data point.
                      enableSideBySideSeriesPlacement: false,
                      series: <CartesianSeries<SikhoKamaoData,String>>[
                        BarSeries<SikhoKamaoData, String>(
                            dataSource: sikhoKamaoDataList,
                            xValueMapper: (SikhoKamaoData data, _) => data.stateName,
                            yValueMapper: (SikhoKamaoData data, _) => data.Candidatetrained,
                            name: 'No. of Candidate Trainer',
                            color: Color.fromRGBO(8, 142, 255, 1),
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelAlignment: ChartDataLabelAlignment.outer, // Display labels at the top of the bar
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Customize the text style
                        ),
                        ),
                         )
                      ])
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text("Show State/UT-Wise Number of Beneficiaries under Seekho aur Kamao Scheme ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color:  Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(onPressed:()=>launchUrlString('https://api.data.gov.in/resource/71dafc8e-5b40-4797-aa94-84e456e3ff49?api-key=579b464db66ec23bdd0000012b16201eddcf4af86447cced80cdb287&format=json&offset=10&limit=1000'), child:Text("Data Source: data.gov.in(click)") ),
              ElevatedButton(onPressed:(){
                context.pop();
                //GoRouter.of(context).go('/path') for replacement with new screen
              }, child: Text("Go BACK"))

            ],
          ),
        ));
  }
}
