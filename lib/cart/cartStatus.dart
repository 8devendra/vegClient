import 'package:flutter/material.dart';
import './CartList.dart';
import '../globals.dart';
import 'package:http/http.dart' as http;

class CartStatus extends StatelessWidget {
  final String data;
  CartStatus({
    Key key,
    @required this.data,
  }) : super(key: key);

    Future updateCart(String id) async {
    try {
     // pr.show();
      var url = 'https://devlopeme.000webhostapp.com/carttoorder.php?id='+id;

      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        String responseBody = response.body;
        print(responseBody);
       // pr.hide();
      } else {
        print('Error In connection');
        //pr.hide();
      }
    } catch (err) {
      //pr.hide();
      print(err.toString());
    }
  }

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
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){updateCart(usid);
Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Ordered..')));
            }, icon: Icon(Icons.add_shopping_cart), label: Text('Order')),
      ),
    );
  }
}
