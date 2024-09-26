import 'dart:convert';
import 'package:flchart/models/roaddata.dart';
import 'package:flchart/models/seekhoKamaouData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Provider for accessing the state notifier for RoadData
final fetchRoadDataProvider = StateNotifierProvider<FetchRoadDataNotifier, List<RoadData>>(
      (ref) => FetchRoadDataNotifier(),
);

///provider for accessing the state Notifier for KamaoSikho
final fetchSikhoKamaoDataProvider = StateNotifierProvider<FetchSikhoKamaoDataNotifier, List<SikhoKamaoData>>(
      (ref)=> FetchSikhoKamaoDataNotifier(),
);

// Define a state notifier for road data
class FetchRoadDataNotifier extends StateNotifier<List<RoadData>>{
  FetchRoadDataNotifier():super([]);
   //fetch data from APi
  Future<void> fetchRoadData() async {
      if(state.isNotEmpty) return;//skip the repeating data fetch
    print("fetchRoad data funtion called");
    try {
      const url =
          'https://api.data.gov.in/resource/d4361151-6d41-43c7-98cd-9a6cd90b5ca4?api-key=579b464db66ec23bdd0000012b16201eddcf4af86447cced80cdb287&format=json&limit=50';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> records = data['records'];
        List<RoadData> roadDataList = records.map(
                (json) => RoadData.fromJson(json)
        ).toList();
        state = roadDataList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}


/////Sikho KAmao DataNotifier

class FetchSikhoKamaoDataNotifier extends StateNotifier<List<SikhoKamaoData>>
{
  List<SikhoKamaoData> listData=[];
FetchSikhoKamaoDataNotifier() : super([]);

Future<void> fetchSikhoKamaoData() async{
  if(state.isNotEmpty) return;
  print("fetchSikhoKamaodata funtion called");
  try{
    const url ='https://api.data.gov.in/resource/71dafc8e-5b40-4797-aa94-84e456e3ff49?api-key=579b464db66ec23bdd0000012b16201eddcf4af86447cced80cdb287&format=json&offset=10&limit=1000';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
    {
      final data= jsonDecode(response.body);
      List<dynamic> records = data['records'];
      print("printing the records");
      print(records);
      records.forEach((json)
      {
        print(json["state_ut"]);
        print(json["candidates_trained"]);
        listData.add(SikhoKamaoData.fromjson(json));
      });
     state = listData;
    }
    else
    {
      throw Exception('Failed to load data');
    }

  }//try block
  catch(e)
  {
    throw Exception('Failed to load data');
    print(e.toString());
  }

}
}
