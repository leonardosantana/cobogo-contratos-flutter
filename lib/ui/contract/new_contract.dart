import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:fcobogo_contratos/blocs/new_contract_bloc.dart';
import 'package:fcobogo_contratos/provider/provider.dart';
import 'package:fcobogo_contratos/ui/login/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContractForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewContractProvider(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Novo Contrato"),
          ),
          backgroundColor: Color(0xFF736AB7),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
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
          ),
        ),
      ),
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
          onPressed: (){
            if(snapshot.hasData){
              bloc.submit();
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new HomePage())
              );
            }

          }
        );
      }
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '250.000,00',
                labelText: 'Valor',
                errorText: snapshot.error,
              ));
        });
  }

  estimatedCustField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.cust,
        builder: (context, snapshot) {
          return TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '250.000,00',
                labelText: 'Custo estimado',
                errorText: snapshot.error,
              ));
        });
  }

  totalAreaField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.area,
        builder: (context, snapshot) {
          return TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '200,00',
                labelText: 'Área do projeto',
                errorText: snapshot.error,
              ));
        });
  }

  startDateField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.startDate,
        builder: (context, snapshot) {
          return DateTimePickerFormField(
            onChanged: bloc.changeStartDate,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            editable: true,
            decoration: InputDecoration(
                labelText: 'Data de início', hasFloatingPlaceholder: false),
          );
        });
  }

  deliveryDateField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.deliveryDate,
        builder: (context, snapshot) {
          return DateTimePickerFormField(
            onChanged: bloc.changeDeliveryDate,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            editable: true,
            decoration: InputDecoration(
                labelText: 'Data de entrega', hasFloatingPlaceholder: false),
          );
        });
  }

  phasesField(NewContractBloc bloc) {
    return StreamBuilder(
        stream: bloc.phase,
        builder: (context, snapshot) {
          return TextField(
              onChanged: bloc.changePhase,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Projetos',
                labelText: 'Fases',
                errorText: snapshot.error,
              ));
        });
  }
}
