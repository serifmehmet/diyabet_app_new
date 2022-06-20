class TimeModel {
  int? id;
  String? hour;

  TimeModel({this.id, this.hour});
}

class TimeModels {
  late List<TimeModel> timeModelList = [];
  TimeModels.create() {
    timeModelList = [
      TimeModel(id: 1, hour: "00:00"),
      TimeModel(id: 2, hour: "00:30"),
      TimeModel(id: 3, hour: "01:00"),
      TimeModel(id: 4, hour: "01:30"),
      TimeModel(id: 5, hour: "02:00"),
      TimeModel(id: 6, hour: "02:30"),
      TimeModel(id: 7, hour: "03:00"),
      TimeModel(id: 8, hour: "03:30"),
      TimeModel(id: 9, hour: "04:00"),
      TimeModel(id: 10, hour: "04:30"),
      TimeModel(id: 11, hour: "05:00"),
      TimeModel(id: 12, hour: "05:30"),
      TimeModel(id: 13, hour: "06:00"),
      TimeModel(id: 14, hour: "06:30"),
      TimeModel(id: 15, hour: "07:00"),
      TimeModel(id: 16, hour: "07:30"),
      TimeModel(id: 17, hour: "08:00"),
      TimeModel(id: 18, hour: "08:30"),
    ];
  }
}
