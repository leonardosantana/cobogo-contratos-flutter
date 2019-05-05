import 'package:fcobogo_contratos/model/activity.dart';
import 'package:fcobogo_contratos/model/cust.dart';
import 'package:fcobogo_contratos/model/phase.dart';
import 'package:fcobogo_contratos/ui/home/gradient_app_bar.dart';
import 'package:fcobogo_contratos/ui/widgets/expandable_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  DateTime startDate;
  Duration duration;
  DateTime endDate;
  List<Activity> _projectActivities;
  List<Activity> _basesActivities;
  Phase _projetos;
  Phase _bases;
  List<Phase> _contractPhases;

  _ActivityScreenState() {
    endDate = DateTime.now();
    duration = Duration(days: 5);
    startDate = endDate.subtract(duration);

    _projectActivities = [
      Activity("Projeto de arquitetura", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Projeto de arquitetura", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Projeto de arquitetura", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
    ];

    _projetos = Phase("Projetos","Elaboração de projetos", _projectActivities);

    _basesActivities = [
      Activity("Canteiro de obra", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Fundações rasas", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Arranque dos pilares", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Impermeabilização das fundações", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
      Activity("Compactação do solo e piso grosso", "aslkdaslkd alksdjassl kd ", startDate, endDate, Cust(100.00, 100.00, 100.00), null, 0, null),
    ];
    _bases = Phase("Fundações", "construção das fundações", _basesActivities);

    _contractPhases = [_projetos, _bases];

  }









  @override

  Widget build(BuildContext context) {

    List<double> data = [160,148,122,110,98,84,75,60,45,33,22,11,1,0];

    return  new Scaffold(
      appBar: AppBar(

        title: Hero(
          tag: "activities-hero",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "Cronograma",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
          )
        ),
      ),
      body:
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue ),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(40),
                    child: Sparkline(
                      data: data,
                      lineWidth: 5.0,
                      lineColor: Colors.white,
                    )
                ),
                ExpandableListView(_contractPhases)
              ],
            ),
          )
      );
  }
}
