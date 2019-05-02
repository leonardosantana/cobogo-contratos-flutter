import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/ui/activity/activity_screen.dart';
import 'package:fcobogo_contratos/ui/detail/separator.dart';
import 'package:fcobogo_contratos/ui/common/contract_summary.dart';
import 'package:fcobogo_contratos/ui/text_style.dart';
import 'package:flutter/material.dart';


class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class ResumePage extends StatefulWidget {

  final Contract contract;

  ResumePage(this.contract);

  @override
    _ResumePage createState() => new _ResumePage(contract);
  }

class _ResumePage extends State<ResumePage> with TickerProviderStateMixin{


  final Contract contract;

  _ResumePage(this.contract);

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();

  }

  ScrollController scrollController;

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
  var cardIndex = 0;
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground () {
    return new Container(
      child: new Image.network(contract.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Detalhes".toUpperCase();
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        ContractSummary(contract,
          horizontal: false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_overviewTitle, style: Style.headerTextStyle,),
              Separator(),
              Text( contract.details, style: Style.commonTextStyle),
              _getActivities()
            ],
          ),
        ),
      ],
    );
  }

  Widget _getActivities(){
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 32.0),
      child: _containerList()
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),
    );
  }

  controlEnds(details){

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    animationController.addListener(() {
      setState(() {
        currentColor = colorTween.evaluate(curvedAnimation);
      });
    });

    if(details.velocity.pixelsPerSecond.dx > 0) {
      if(cardIndex>0) {
        cardIndex--;
        colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
      }
    }else {
      if(cardIndex<2) {
        cardIndex++;
        colorTween = ColorTween(begin: currentColor,
            end: appColors[cardIndex]);
      }
    }
    setState(() {
      scrollController.animateTo((cardIndex)*222.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    });

    colorTween.animate(curvedAnimation);

    animationController.forward( );

  }


  Widget _containerList(){

    var cardsList = [
      _resumeActivities(),
      _resumeCusts(),
      _resumeManager()
    ];


    return Container(
      height: 350.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: cardsList.length,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardsList[position],
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityScreen(),
                ),
              );
            },
            onHorizontalDragEnd: (details) => controlEnds(details),
          );
        },
      ),
    );
  }

  _resumeActivities(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Hero(
            tag: "activities-hero",
            child:  Material(
              color: Colors.transparent,
              child: Text(
                "Cronograma",
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("32% das atividade concluidas", style: TextStyle(color: Colors.grey),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(value: 0.32,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("Em Execução:\tFundação - montagem das vigas - 30/04\n\nProximas:\t\tFundação - nivel do contrapiso - 02/05", style: TextStyle(fontSize: 8.0, color: Colors.grey),),
        ),
      ],
    );
  }

  _resumeCusts(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("Custos", style: TextStyle(fontSize: 24.0),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("45% do orçamento consumido", style: TextStyle(color: Colors.grey),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(value: 0.45,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("Ultimos gastos:\n\tFundação - concreto usinado - 4500,00\n\tFundação - ferro - 1800,00", style: TextStyle(fontSize: 8.0, color: Colors.grey),),
        ),
      ],
    );
  }

  _resumeManager(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("Gerencial", style: TextStyle(fontSize: 24.0),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("32% concluido", style: TextStyle(color: Colors.grey),),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(value: 0.32,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text("Proximos Pagamentos:\n\tCastelo Forte - 30/04 - 2750,00\n\tFerragens Pinheiro - 02/05 - 3250,00\n\nProximas Recebimentos:\n\t\tEntrega da fundação - 02/05 - 5000,00", style: TextStyle(fontSize: 8.0, color: Colors.grey),),
        ),
      ],
    );
  }

}