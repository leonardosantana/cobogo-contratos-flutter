import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/repository/contract_repository.dart';
import 'package:rxdart/rxdart.dart';

class ContractBloc {
  final ContractRepository _repository = ContractRepository();
  final BehaviorSubject<List> _subject =
  BehaviorSubject<List>();

  getContracts() async {
    List response = await _repository.getContract();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List> get subject => _subject;

}
final contract_bloc = ContractBloc();