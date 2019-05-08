import 'package:fcobogo_contratos/ui/detail/resume_page.dart';
import 'package:fcobogo_contratos/ui/login/home_page.dart';
import 'package:fcobogo_contratos/ui/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(CobogoContratos());

class CobogoContratos extends StatelessWidget {

final routes = <String, WidgetBuilder>{
  LoginPage.tag: (context) => LoginPage(),
  HomePage.tag: (context) => HomePage()
};

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Kodeversitas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
      fontFamily: 'Nunito',
    ),
    home: LoginPage(),
    routes: routes,
  );
}
}