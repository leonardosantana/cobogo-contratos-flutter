
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class NewContractPage extends StatefulWidget {

  @override
  _NewContractPage createState() => _NewContractPage();
}

class _NewContractPage extends State<NewContractPage> {

  static final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('dd/MM/yyyy'),
    InputType.time: DateFormat("HH:mm"),
  };

  static bool editable = true;
  DateTime date;

  static InputType inputType = InputType.date;
  // init the step to 0th position
  int current_step = 0;

  List<Step> my_steps = [
    new Step(
      // Title of the Step
        title: Text(""),
        // Content, it can be any widget here. Using basic Text for this example
        content: Column(
            children: <Widget>[
              Text("Contrato", style: TextStyle(color: Colors.blue, fontSize: 18),),
              ListTile(
                leading: const Icon(Icons.home),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Contrato",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.details),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Descrição",
                  ),
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.date_range),
                  title: DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                        labelText: 'Data de início', hasFloatingPlaceholder: false),
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.date_range),
                  title: DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                        labelText: 'Data de entrega', hasFloatingPlaceholder: false),
                  )
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: TextField(
                  controller: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', leftSymbol:"Valor: R\$"), //before,
                  decoration: InputDecoration(
                    hintText: "Valor",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: TextField(
                  controller: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', leftSymbol:"Custo: R\$"), //before,
                  decoration: InputDecoration(
                    hintText: "Custo",
                ),
                keyboardType: TextInputType.number,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: TextField(
                  controller: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', leftSymbol:"Area: " ), //before,
                  decoration: new InputDecoration(
                    hintText: "Área",
                  ),
                ),
              ),

            ]
        ),
        isActive: true),
    new Step(
        title: Text(""),
        // Content, it can be any widget here. Using basic Text for this example
        content: Column(
            children: <Widget>[
              Text("Contratante", style: TextStyle(color: Colors.blue, fontSize: 18),),
              ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Nome",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Telefone",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.mail),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
            ]
        ),
        isActive: true),
    new Step(
        title: Text(""),
        // Content, it can be any widget here. Using basic Text for this example
        content: Column(
            children: <Widget>[
              Text("Endereço", style: TextStyle(color: Colors.blue, fontSize: 18),),
              ListTile(
                leading: const Icon(Icons.map),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "CEP",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Rua",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Número",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.my_location),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Bairro",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Cidade",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_searching),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Estado",
                  ),
                ),
              )
            ]
        ),
        isActive: true),
    new Step(
        title: Text(""),
      // Content, it can be any widget here. Using basic Text for this example
        content: Column(
            children: <Widget>[
              Text("Fases", style: TextStyle(color: Colors.blue, fontSize: 18),),
              ListTile(
                leading: const Icon(Icons.bookmark),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Fase",
                  ),
                ),
              ),
            ]
        ),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Simple Material App"),
      ),
      // Body
      body: new Container(
          child: new Stepper(
            // Using a variable here for handling the currentStep
            currentStep: this.current_step,
            // List the steps you would like to have
            steps: my_steps,
            // Define the type of Stepper style
            // StepperType.horizontal :  Horizontal Style
            // StepperType.vertical   :  Vertical Style
            type: StepperType.horizontal,
            // Know the step that is tapped
            onStepTapped: (step) {
              // On hitting step itself, change the state and jump to that step
              setState(() {
                // update the variable handling the current step value
                // jump to the tapped step
                current_step = step;
              });
              // Log function call
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              // On hitting cancel button, change the state
              setState(() {
                // update the variable handling the current step value
                // going back one step i.e subtracting 1, until its 0
                if (current_step > 0) {
                  current_step = current_step - 1;
                } else {
                  current_step = 0;
                }
              });
              // Log function call
              print("onStepCancel : " + current_step.toString());
            },
            // On hitting continue button, change the state
            onStepContinue: () {
              setState(() {
                // update the variable handling the current step value
                // going back one step i.e adding 1, until its the length of the step
                if (current_step < my_steps.length - 1) {
                  current_step = current_step + 1;
                } else {
                  current_step = 0;
                }
              });
              // Log function call
              print("onStepContinue : " + current_step.toString());
            },
          )),
    );
  }
}