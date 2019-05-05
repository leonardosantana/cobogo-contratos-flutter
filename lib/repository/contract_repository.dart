
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/provider/contract_provider.dart';

class ContractRepository{
  ContractProvider _apiProvider = ContractProvider();

  Future<List> getContract(){
    return _apiProvider.getContracts();
  }
}