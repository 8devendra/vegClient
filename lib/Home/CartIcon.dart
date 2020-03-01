import 'package:flutter/material.dart';
import '../globals.dart' as glob;
import '../cart/cartStatus.dart';

class CartIcon extends StatefulWidget {
  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  int ca;
  void adVal(int c) {
    setState(() {
      //glob.cart=glob.cart+c;
      ca = c;
    });
    //glob.cart=glob.cart+c;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('d');
        Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CartStatus(data: 'in cart')));
      },
      child: Stack(
        children: <Widget>[
          new Image.asset("assets/image/shopping.png"),
          new Positioned(
            top: 1.0,
            right: 4.0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: new BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                child: new Text(0.toString(),
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
