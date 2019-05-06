import 'dart:async';

class NewContractValidator {

  final validateContractName =
  StreamTransformer<String, String>.fromHandlers(handleData: (contractName, sink) {
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
}