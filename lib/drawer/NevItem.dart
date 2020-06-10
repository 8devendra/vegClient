import 'package:flutter/material.dart';
import '../cart/cartStatus.dart';
import '../orderStatus/ordStatus.dart';
import 'dart:convert';
import '../globals.dart';
import 'package:http/http.dart' as http;
//import 'package:progress_dialog/progress_dialog.dart';

class NevItem extends StatelessWidget {








  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(usName),
          accountEmail: Text(usEmail),
        ),
        ListTile(
            //leading: Icon(Icons.add),
            title: Text('Cart'),
            trailing: Icon(Icons.add_circle),
            onTap: () {
              //Navigator.of(context).pushNamed('/cart', arguments: 'in cart');
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CartStatus(data: 'in cart')));
            }),
        ListTile(
            //leading: Icon(Icons.add),
            title: Text('OrderStatus'),
            trailing: Icon(Icons.change_history),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new OrderStatus(data: 'in Orsts')));
             
            }),
        ListTile(title: Text('Settings'), trailing: Icon(Icons.settings))
      ],
    );
  }
}
