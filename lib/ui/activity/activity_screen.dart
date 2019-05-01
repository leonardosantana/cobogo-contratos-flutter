import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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

    return  Scaffold(
      body:  Center(
        child:  Container(
            padding: const EdgeInsets.all(17.0),
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  const Color(0xFF8C9EFF),
                  const Color(0xFF3D5AFE),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
            width: 200,
            height: 500,
            child: Column(
              children: <Widget>[
                Sparkline(
                  data: data,
                  lineWidth: 5.0,
                  lineColor: Colors.white,
                ),
             ],
            )
          )

        ),
      ),
    );
  }
}
