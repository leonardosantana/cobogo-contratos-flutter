
import 'package:fcobogo_contratos/model/activity.dart';
import 'package:json_annotation/json_annotation.dart';

class Phase{

  String name;
  String details;

  List<Activity> activities;

  Phase(this.name, this.details, this.activities);

}