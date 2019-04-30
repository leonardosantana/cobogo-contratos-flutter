import 'package:flutter/material.dart';

class CustScreen extends StatefulWidget {
  @override
  _CustScreenState createState() => _CustScreenState();
}

class _CustScreenState extends State<CustScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFFff8a80),
            const Color(0xFFff1744),
          ],
          stops: [
            0.0,
            1.0,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: new Center(
        child: new Text(
          'CUSTOS',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Helvetica',
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
