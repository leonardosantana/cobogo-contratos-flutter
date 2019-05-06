import 'dart:async';
import 'package:fcobogo_contratos/validator/new_contract_validator.dart';
import 'package:rxdart/rxdart.dart';

class NewContractBloc extends Object with NewContractValidator {

  final _contractNameController = BehaviorSubject<String>();
  final _detailsController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();
  final _valueController = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get contractName => _contractNameController.stream.transform(validateContractName);
  Stream<String> get details => _detailsController.stream.transform(validateDetails);
  Stream<String> get address => _addressController.stream.transform(validateAddress);
  Stream<String> get value => _valueController.stream.transform(validateValue);


  Stream<bool> get submitValid =>
      Observable.combineLatest4(contractName, details, address, value (c, d, a, v) => true);

  // change data
  Function(String) get changeContractName => _contractNameController.sink.add;
  Function(String) get changeDetails => _detailsController.sink.add;
  Function(String) get changeAddress => _addressController.sink.add;
  Function(String) get changeValue => _valueController.sink.add;

  submit() {
    final validContractName = _contractNameController.value;
    final validDetails = _detailsController.value;
    final validAddress = _addressController.value;
    final validValue = _valueController.value;

    print('nome do contrato is $validContractName, and detalils is $validDetails');
  }

  dispose() {
    _contractNameController.close();
    _detailsController.close();
    _addressController.close();
    _valueController.close();
  }
}

//Note: This creates a global instance of Bloc that's automatically exported and can be accessed anywhere in the app
final newContractBloc = NewContractBloc();