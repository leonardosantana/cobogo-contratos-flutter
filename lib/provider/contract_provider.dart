
import 'dart:convert';

import 'package:fcobogo_contratos/model/address.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:dio/dio.dart';

class ContractProvider{

  final String _endpointLocal = "http://192.168.0.19:8080/contratos";
  final String _endpointHeroku = "https://cobogo-contratos.herokuapp.com/contratos";

  final Dio _dio = Dio();

  Future<List> getContracts() async {
    try {

      Map<String, String> headersMap = {
        'Content-Type' : 'application/json',
      };

      Response response = await _dio.get(_endpointLocal);

      return _responseToList(response.data);

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  List<Contract> _responseToList(var responseData){

    if(responseData.length <=0) {
      return null;
    }


    List<Contract> contracts = List();
    for(int i = 0; i < responseData.length; i++){

      Contract contract = Contract(null,
          responseData[i]["name"],
          responseData[i]["address"],
          responseData[i]["value"],
          responseData[i]["stimatedCust"],
          responseData[i]["totalArea"],
          responseData[i]["startDate"] == null ? null : DateTime(responseData[i]["startDate"]),
          responseData[i]["deliveryDate"] == null ? null : DateTime(responseData[i]["deliveryDate"]),
          responseData[i]["details"],
          "assets/images/houseBuild.png",
          "https://images.freeimages.com/images/large-previews/f3e/building-1522324.jpg",
          responseData[i]["phases"]);

      contracts.add(contract);

    }

    return contracts;

  }

}