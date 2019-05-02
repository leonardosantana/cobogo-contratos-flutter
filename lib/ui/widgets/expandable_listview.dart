import 'package:fcobogo_contratos/model/Phase.dart';
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
          children: _contractPhases[i].activitiesList
              .map((data) => ListTile(
            leading: Icon(Icons.business_center, color: Colors.blue),
            title: Text(data.name, style: TextStyle(color: Colors.white)),
            subtitle: Text(data.details, style: TextStyle(color: Colors.white)),
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