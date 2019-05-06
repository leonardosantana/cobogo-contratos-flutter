import 'package:fcobogo_contratos/blocs/new_contract_bloc.dart';
import 'package:flutter/material.dart';

class NewContractProvider extends InheritedWidget {

  final newContractBloc = NewContractBloc();

  NewContractProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static NewContractBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NewContractProvider) as NewContractProvider).newContractBloc;
  }
}