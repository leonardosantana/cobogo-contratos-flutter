
import 'dart:convert';

import 'package:fcobogo_contratos/model/address.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:dio/dio.dart';

class ContractProvider{
  final String _endpoint = "http://192.168.0.19:8080/contratos";
  final Dio _dio = Dio();

  Future<List> getContracts() async {
    try {

      Map<String, String> headersMap = {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU1NzYyMTYwNn0.fhg5nCK7H5W5FvM6jbjuD6X0rMEiy3NtrMQ53JIRibdbVYQ_4gPBoAjP1OAg9qUkf_DFIxmlPeaKAw71ZbO7wA' ,
      };

      Response response = await _dio.get(_endpoint);

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
          Address("asd asda aasd"),
          responseData[i]["value"],
          responseData[i]["stimatedCust"],
          responseData[i]["totalArea"],
          responseData[i]["startDate"],
          responseData[i]["deliveryDate"],
          responseData[i]["details"],
          "assets/images/houseBuild.png",
          "https://images.freeimages.com/images/large-previews/f3e/building-1522324.jpg",
          responseData[i]["phases"]);

      contracts.add(contract);

    }

    return contracts;

  }

}