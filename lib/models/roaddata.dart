// model for tha Road data
class RoadData {
  final String stateName;
  final double roadlengthSanctioned;
  final double roadlengthCompleted;
  final double? expenditureInLakhs;

  RoadData({//constructor to initialize the data
    required this.stateName,
    required this.roadlengthSanctioned,
    required this.roadlengthCompleted,
    this.expenditureInLakhs,
  });

  // Factory method to fill data from map
  factory RoadData.fromJson(Map<String, dynamic> json) { //fill the data
    return RoadData(
      stateName: json['STATE_NAME'],
      roadlengthSanctioned:( json['LENGTH_OF_ROAD_WORK_SANCTIONED_KM'] as num).toDouble(),
      roadlengthCompleted: (json['LENGTH_OF_ROAD_WORK_COMPLETED_KM']as num).toDouble(),
      expenditureInLakhs: (json['EXPENDITURE_OCCURED_LAKHS']as num).toDouble(),
    );
  }
}
