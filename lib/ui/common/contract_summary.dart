import 'package:fcobogo_contratos/model/contract.dart';
import 'package:flutter/material.dart';
import 'package:fcobogo_contratos/ui/detail/separator.dart';
import 'package:fcobogo_contratos/ui/detail/resume_page.dart';
import 'package:fcobogo_contratos/ui/text_style.dart';

class ContractSummary extends StatelessWidget {

  final Contract contract;
  final bool horizontal;

  ContractSummary(this.contract, {this.horizontal = true});

  ContractSummary.vertical(this.contract): horizontal = false;


  @override
  Widget build(BuildContext context) {

    final contractThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "contract-hero-${contract.name}",
        child: new Image(
          image: new AssetImage(contract.imagePath),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );



    Widget _contractValue({String value, String image}) {
      return new Container(
        child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Image.asset(image, height: 12.0),
              new Container(width: 8.0),
              new Text(value, style: Style.smallTextStyle),
            ]
        ),
      );
    }


    final contractCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(contract.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(contract.address == null ? "" : contract.address, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _contractValue(
                      value: "40%",
                      image: 'assets/images/ic_distance.png')

              ),
              new Container (
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _contractValue(
                      value: contract.stimatedCust.toString(),
                      image: 'assets/images/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );


    final contractCard = new Container(
      child: contractCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
          new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new ResumePage(contract),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            new FadeTransition(opacity: animation, child: child),
          ) ,
        )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              contractCard,
              contractThumbnail,
            ],
          ),
        )
    );
  }
}