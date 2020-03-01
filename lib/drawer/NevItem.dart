import 'package:flutter/material.dart';
import '../cart/cartStatus.dart';

class NevItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('User Name'),
          accountEmail: Text('Abc@1234.com'),
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
        ListTile(title: Text('Settings'), trailing: Icon(Icons.settings))
      ],
    );
  }
}
