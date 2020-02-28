//import 'package:farmer_app/route_generator.dart';
import 'package:flutter/material.dart';
import './route_generator.dart';

//import './login/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      title: 'flutter client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //fontFamily: 'Segoe',
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      
    ); 
  }
}

