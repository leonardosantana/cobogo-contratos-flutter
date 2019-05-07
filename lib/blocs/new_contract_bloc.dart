import 'dart:async';
import 'package:fcobogo_contratos/model/address.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/model/phase.dart';
import 'package:fcobogo_contratos/repository/contract_repository.dart';
import 'package:fcobogo_contratos/repository/new_contract_repository.dart';
import 'package:fcobogo_contratos/validator/new_contract_validator.dart';
import 'package:rxdart/rxdart.dart';

class NewContractBloc extends Object with NewContractValidator {

  final NewContractRepository _repository = NewContractRepository();

  final _contractNameController = BehaviorSubject<String>();
  final _detailsController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();
  final _valueController = BehaviorSubject<double>();
  final _custController = BehaviorSubject<double>();
  final _areaController = BehaviorSubject<double>();
  final _startDateController = BehaviorSubject<DateTime>();
  final _deliveryDateController = BehaviorSubject<DateTime>();
  final _phaseController = BehaviorSubject<String>();

  final BehaviorSubject<Contract> _subject = BehaviorSubject<Contract>();

  // Add data to stream
  Stream<String> get contractName => _contractNameController.stream.transform(validateContractName);
  Stream<String> get details => _detailsController.stream.transform(validateDetails);
  Stream<String> get address => _addressController.stream.transform(validateAddress);
  Stream<double> get value => _valueController.stream.transform(validateDouble);
  Stream<double> get cust => _custController.stream.transform(validateDouble);
  Stream<double> get area => _areaController.stream.transform(validateDouble);
  Stream<DateTime> get startDate => _startDateController.stream.transform(validateDate);
  Stream<DateTime> get deliveryDate => _deliveryDateController.stream.transform(validateDate);
  Stream<String> get phase => _phaseController.stream.transform(validateAddress);


  Stream<bool> get submitValid =>
      Observable.combineLatest2(contractName, details,
              (cntn, dtls) => true);

  // change data
  Function(String) get changeContractName => _contractNameController.sink.add;
  Function(String) get changeDetails => _detailsController.sink.add;
  Function(String) get changeAddress => _addressController.sink.add;
  Function(double) get changeValue => _valueController.sink.add;
  Function(double) get changeCust => _custController.sink.add;
  Function(double) get changeArea => _areaController.sink.add;
  Function(DateTime) get changeStartDate => _startDateController.sink.add;
  Function(DateTime) get changeDeliveryDate => _deliveryDateController.sink.add;
  Function(String) get changePhase => _phaseController.sink.add;

  submit() async{
    final validContractName = _contractNameController.value;
    final validDetails = _detailsController.value;
    final validAddress = _addressController.value;
    final validValue = _valueController.value;
    final validCust = _custController.value;
    final validArea = _areaController.value;
    final validStartDate = _startDateController.value;
    final validDeliveryDate = _deliveryDateController.value;
    final validPhase = _phaseController.value;

    Contract contract = Contract(null, validContractName,
        validAddress,
        validValue,
        validCust,
        validArea,
        validStartDate,
        validDeliveryDate,
        validDetails,
        "assets/images/houseBuild.png",
        "https://images.freeimages.com/images/large-previews/271/office-buildings-in-paris-1228744.jpg",
        null
    );

    Contract response = await _repository.saveContract(contract);
    _subject.sink.add(response);

  }

  dispose() {
    _contractNameController.close();
    _detailsController.close();
    _addressController.close();
    _valueController.close();
    _custController.close();
    _areaController.close();
    _startDateController.close();
    _deliveryDateController.close();
    _phaseController.close();
  }
}

//Note: This creates a global instance of Bloc that's automatically exported and can be accessed anywhere in the app
final newContractBloc = NewContractBloc();