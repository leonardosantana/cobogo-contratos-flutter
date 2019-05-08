import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/ui/home/gradient_app_bar.dart';
import 'package:fcobogo_contratos/ui/home/home_page_body.dart';
import 'package:flutter/material.dart';

import 'package:fcobogo_contratos/ui/contract/new_contract.dart';


class HomePage extends StatefulWidget {

  static String tag = 'ui.home-page';

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Column(
        children: <Widget>[
          new GradientAppBar("Cobogó"),
          new HomePageBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showNewContractPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }


  void _showNewContractPage() async{

    final contract = await Navigator.push(context,
        MaterialPageRoute(builder: (context)=> ContractForm())
    );

  }
}

class GradientAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(title,
          style:const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 36.0
          ),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF3366FF),
              const Color(0xFF00CCFF)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}