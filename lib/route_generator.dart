//import 'package:farmer_app/farmer/dashbord.dart';
//import 'package:farmer_app/farmer/Dashbord.dart';
import 'package:flutter/material.dart';
//import './main.dart';
import './login/Login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);
    //var ca=int.parse(settings.name);
    switch (settings.name) {
      case '/':
        print('inside / ');
        return MaterialPageRoute(builder: (_) => Login());
      case '/dashbord':
        print('inside dashbord ');
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => null,//Dashbord(data:args),
          ); // data: args
        }
        return _errorRoute();

        case '/addVeg':
        print('inside addVeg ');
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => null,//AddVeg(data:args),
          ); // data: args
        }
        return _errorRoute();

        case '/update':
        print('inside update ');
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => null,//Update(data:args),
          ); // data: args
        }
        return _errorRoute();

        case '/delete':
        print('inside delete ');
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => null,//delete(data:args),
          ); // data: args
        }
        return _errorRoute();

      //if(args is String){
      //}
      //return _errorRoute();
      default:
        print('Default');
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: '),
        ),
      );
    });
  }
}
