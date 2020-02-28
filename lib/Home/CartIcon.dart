import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          new Image.asset("assets/image/shopping.png"),
          new Positioned(
            top: 1.0,
            right: 4.0,
            child: new Text('2',
                style: new TextStyle(
                    color: Colors.redAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
