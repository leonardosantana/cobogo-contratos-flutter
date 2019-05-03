

class Activity {

  int id;
  int days;
  DateTime startDate, endDate;
  String name;
  List<int> predecessors;

  Activity(this.id,  //
      this.days,  //
      this.startDate, //
      this.endDate,  //
      this.name, //
      this.predecessors);

}