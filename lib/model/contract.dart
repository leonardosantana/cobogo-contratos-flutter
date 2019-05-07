
import 'dart:core';

import 'package:fcobogo_contratos/model/activity.dart';
import 'package:fcobogo_contratos/model/phase.dart';
import 'package:fcobogo_contratos/model/address.dart';
import 'package:fcobogo_contratos/model/user.dart';

class Contract{

  User user;
  String name;
  String address;
  double value;
  double stimatedCust;
  double totalArea;
  DateTime startDate;
  DateTime deliveryDate;
  String details;
  String imagePath;
  String imageBackgroundPath;

  List<Phase> phases;

  String error;


  Contract(this.user, this.name, this.address, this.value, this.stimatedCust,
      this.totalArea, this.startDate, this.deliveryDate, this.details,
      this.imagePath, this.imageBackgroundPath, this.phases);

  Contract.withError(String errorValue)
      : error = errorValue;

  Contract.fromJson(Map<String, dynamic> json)
      : name = (json["name"] as String),
        error = "";

}

User user = User("name", "pass", "email", Address("address"), null);
Contract contract = Contract(user,
  "casa 7",
  "adfasfa",
  20.5,
  50.7,
  200.0,
  DateTime.now(),
  DateTime.now(),
  "detalhes",
  "assets/images/houseBuild.png",
  "https://images.freeimages.com/images/large-previews/271/office-buildings-in-paris-1228744.jpg",
  null);

List<Contract> contracts = [
  contract
];


