import 'package:fcobogo_contratos/model/Activity.dart';
import 'package:fcobogo_contratos/model/Phase.dart';
import 'package:fcobogo_contratos/ui/home/gradient_app_bar.dart';
import 'package:fcobogo_contratos/ui/widgets/expandable_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;





class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  static List<Activity> _projectActivities = [
    Activity("Projeto de arquitetura", "01/05"),
    Activity("Projeto estrutural", "01/05"),
    Activity("Projeto de hidraulica", "01/05"),
    Activity("Projeto eletrico", "01/05")
  ];
  static Phase _projetos = Phase("Projetos", _projectActivities);


  static List<Activity> _basesActivities = [
    Activity("Canteiro de obra", "01/05"),
    Activity("Fundações rasas", "01/05"),
    Activity("Arranque dos pilares", "01/05"),
    Activity("Impermeabilização das fundações", "01/05"),
    Activity("Compactação do solo e piso grosso", "01/05")
  ];
  static Phase _bases = Phase("Fundações", _basesActivities);


  static List<Activity> _grossoActitivies = [
    Activity("Instalações de esgoto externo","01/05"),
    Activity("Ligação à rede da concessionária local","01/05"),
    Activity("Alvenarias e pilares","01/05"),
    Activity("Vigas e lajes","01/05"),
    Activity("Instalações embutidas de água fria","01/05"),
    Activity("Instalações embutidas de esgoto","01/05"),
    Activity("Instalações de águas pluviais","01/05"),
    Activity("Instalações embutidas de eletricidade, tv e telefone","01/05"),
    Activity("Reboco interno","01/05"),
    Activity("Reboco das fachadas","01/05"),
    Activity("Calçadas","01/05"),
    Activity("Telhados","01/05"),
    Activity("contrapiso","01/05")
  ];
  static Phase _grosso = Phase("Grosso", _grossoActitivies);


  static List<Activity> _polishedActivities = [
    Activity("Pintura externa","01/05"),
    Activity("Reboco das fachadas","01/05"),
    Activity("Fiação de tv, telefonia e interfone","01/05"),
    Activity("Forro de gesso em dry wall","01/05"),
    Activity("Revestimento cerâmico de piso","01/05"),
    Activity("Revestimento cerâmico de parede","01/05"),
    Activity("Portas de madeira e ferragens","01/05"),
    Activity("Esquadrias de vidro","01/05"),
    Activity("Louças, bancadas e metais","01/05"),
    Activity("Pintura interna","01/05"),
    Activity("Iluminação, interruptores e tomadas","01/05")
  ];
  static Phase _polished = Phase("Acabamentos", _polishedActivities);

  static List<Phase> _contractPhases = [_projetos, _bases, _grosso, _polished];

  @override

  math.Random random = new math.Random();

  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add((random.nextDouble() * 100) % 2);
    }
    return result;
  }

  Widget build(BuildContext context) {

    final double barHeight = 66.0;

    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    List<double> data = [160,148,122,110,98,84,75,60,45,33,22,11,1,0];

    return  new Scaffold(
      appBar: AppBar(

        title: Hero(
          tag: "activities-hero",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "Cronograma",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
          )
        ),
      ),
      body:
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue ),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(40),
                    child: Sparkline(
                      data: data,
                      lineWidth: 5.0,
                      lineColor: Colors.white,
                    )
                ),
                ExpandableListView(_contractPhases)
              ],
            ),
          )


      /*Container(
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40),
              child: Sparkline(
                data: data,
                lineWidth: 5.0,
                lineColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Material(
                color: Colors.transparent,
                child:  Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Expanded(child: Text("123"))
                  )
                )
              )
           ]
          )
        )*/
      );
  }
}
