import 'package:flutter/material.dart';
import 'package:proyecto_moviles/src/login/login_page.dart';
import 'package:proyecto_moviles/src/register/register_page.dart';
import 'package:proyecto_moviles/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //para quitar la etiqueta de debug
      title: 'Deliverry App Flutter',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage()
      },
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
        //fontFamily: 'Roboto',
      ),
    );
  }
}
