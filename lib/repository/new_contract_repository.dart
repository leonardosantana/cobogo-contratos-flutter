
import 'package:dio/dio.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/provider/provider.dart';

class NewContractRepository{

  final String _endpointLocal = "http://192.168.0.19:8080/contratos";
  final String _endpointHeroku = "https://cobogo-contratos.herokuapp.com/contratos";

  final Dio _dio = Dio();

  Future<bool> saveContract(Contract contract) async{

    try {

      Map<String, String> headersMap = {
        'Content-Type' : 'application/json',
      };

      Response response = await _dio.post(_endpointLocal, data:
      {
        "user": null,
        "name": contract.name,
        "address": contract.address,
        "value": contract.value,
        "stimatedCust": contract.stimatedCust,
        "totalArea": contract.totalArea,
        "startDate": null,
        "deliveryDate": null,
        "details": contract.details,
        "phases": contract.phases
      });

      return true;

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

}