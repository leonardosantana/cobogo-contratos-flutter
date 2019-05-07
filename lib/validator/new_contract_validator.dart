import 'dart:async';

class NewContractValidator {

  final validateContractName =
  StreamTransformer<String, String>.fromHandlers(
      handleData: (contractName, sink) {
        if (contractName.isNotEmpty) {
          sink.add(contractName);
        } else {
          sink.addError('Entre um nome valido');
        }
      });

  final validateDetails = StreamTransformer<String, String>.fromHandlers(
      handleData: (details, sink) {
        if (details.length > 4) {
          sink.add(details);
        } else {
          sink.addError('descreva algumas caracteristicas do projeto');
        }
      }
  );

  final validateAddress = StreamTransformer<String, String>.fromHandlers(
      handleData: (address, sink) {
        if (address.length > 4) {
          sink.add(address);
        } else {
          sink.addError('Informe o endereço corretamente');
        }
      }
  );

  final validateValue = StreamTransformer<String, String>.fromHandlers(
      handleData: (address, sink) {
        if (address.length > 4) {
          sink.add(address);
        } else {
          sink.addError('Informe o endereço corretamente');
        }
      }
  );

  final validateDouble = StreamTransformer<double, double>.fromHandlers(
      handleData: (value, sink) {
        if (value > 0) {
          sink.add(value);
        } else {
          sink.addError('Informe um valor valido');
        }
      }
  );

  final validateDate = StreamTransformer<DateTime, DateTime>.fromHandlers(
      handleData: (date, sink) {
        sink.add(date);
      }
  );
}
