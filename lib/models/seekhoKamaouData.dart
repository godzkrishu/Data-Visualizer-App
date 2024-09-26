import 'package:flchart/models/roaddata.dart';

class SikhoKamaoData{
  final String stateName;
  final int Candidatetrained;
  SikhoKamaoData({//constructor to initialize the data
    required this.stateName,
    required this.Candidatetrained
});
factory SikhoKamaoData.fromjson(Map<String,dynamic> json){
  return SikhoKamaoData(
      stateName: json['state_ut'],
      Candidatetrained: json['candidates_trained'],
  );
}}