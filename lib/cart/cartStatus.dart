import 'package:flutter/material.dart';
import './CartList.dart';

class CartStatus extends StatelessWidget {
final String data;
CartStatus({
    Key key,
    @required this.data,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.tealAccent,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          
        ),
        body: CartList(),
      ),
    );

  }
}