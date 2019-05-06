
import 'package:fcobogo_contratos/blocs/new_contract_bloc.dart';
import 'package:fcobogo_contratos/provider/provider.dart';
import 'package:fcobogo_contratos/ui/home/gradient_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ContractForm extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return NewContractProvider(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              GradientAppBar("Novo Contrato"),
              Expanded(
                child: Container(
                  color: new Color(0xFF736AB7),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: ListView(
                      children: <Widget>[
                        newSubject("Dados do contrato"),
                        contractNameField(newContractBloc),
                        detailsField(newContractBloc),
                        addressField(newContractBloc),
                        valueField(newContractBloc),
                        estimatedCustField(newContractBloc),
                        totalAreaField(newContractBloc),
                        startDateField(newContractBloc),
                        deliveryDateField(newContractBloc),
                        phasesField(newContractBloc),
                        Container(
                          margin: EdgeInsets.only(top: 25.0),
                        ),
                        submitButton(newContractBloc),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        )
      )
    );
  }

  Widget contractNameField(NewContractBloc bloc) {
    return StreamBuilder(
      stream: bloc.contractName,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeContractName,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'casa do Leo e Karine',
            labelText: 'Nome do contrato',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget detailsField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.details,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeDetails,
            decoration: InputDecoration(
              hintText: 'casa com 2 quartos sendo uma suite...',
              labelText: 'Detalhes',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton(NewContractBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Salvar Contrato'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }

  Widget newSubject(String subject) {
    return Column(
      children: <Widget>[
        Text(
          subject,
          style: TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        Divider(
          color: Colors.white,
        )
      ],
    );

  }

  addressField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.address,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeAddress,
            decoration: InputDecoration(
              hintText: 'Rua dos bobos numero 0',
              labelText: 'Endereço',
              errorText: snapshot.error,
            ),
          );
        });
  }

  valueField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.value,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeValue,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Rua dos bobos numero 0',
              labelText: 'Endereço',
              errorText: snapshot.error,
            ),
          );
        });
  }

  estimatedCustField(NewContractBloc bloc) {

  }

  totalAreaField(NewContractBloc bloc) {

  }

  startDateField(NewContractBloc bloc) {

  }

  deliveryDateField(NewContractBloc bloc) {

  }

  phasesField(NewContractBloc bloc) {

  }
}