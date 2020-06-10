import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
    final String data;
  OrderStatus({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Status',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.tealAccent,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: new SafeArea(
          top: false,
          bottom: false,
          child: Form(child: Container()),

          )
      ),
      
    );
  }
}