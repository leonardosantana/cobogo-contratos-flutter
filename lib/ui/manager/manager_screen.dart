import 'package:flutter/material.dart';

class ManagerScreen extends StatefulWidget {
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFFB9F6CA),
            const Color(0xFF00C853),
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
          'GERENCIAMENTO',
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
