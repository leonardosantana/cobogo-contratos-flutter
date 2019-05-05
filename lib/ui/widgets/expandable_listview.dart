import 'package:fcobogo_contratos/model/phase.dart';
import 'package:flutter/material.dart';

class ExpandableListView extends StatelessWidget {

  List<Phase> _contractPhases;
  List<ExpansionTile> _listOfExpansions;

  ExpandableListView(this._contractPhases){_init();}

  void _init(){
    _listOfExpansions = List<ExpansionTile>.generate(
        _contractPhases.length,
            (i) => ExpansionTile(
          title: Text(_contractPhases[i].name, style: TextStyle(color: Colors.white)),
          children: _contractPhases[i].activities
              .map((data) =>  ListTile(
            leading: Icon(Icons.business_center, color: Colors.blue),
            title: Text("${i} - ${data.name}", style: TextStyle(color: Colors.white)),
            subtitle: Text(
                "${data.startDate.day}/${data.startDate.month} ${data.endDate.day}/${data.endDate.month} - ${data.predecessorActivities}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                )
            ),
          ))
              .toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children:
        _listOfExpansions.map((expansionTile) => expansionTile).toList(),
      )
    );
  }
}