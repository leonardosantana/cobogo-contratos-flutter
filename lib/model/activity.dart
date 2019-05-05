

import 'package:fcobogo_contratos/model/Phase.dart';
import 'package:fcobogo_contratos/model/cust.dart';

class Activity {

  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  Cust cust;
  List<int> predecessorActivities;
  int intervalToStart;
  List<Activity> revisions;

  Activity(this.name, this.description, this.startDate,
      this.endDate, this.cust, this.predecessorActivities, this.intervalToStart,
      this.revisions);


}