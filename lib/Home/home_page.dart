import 'package:flutter/material.dart';
//import '../assets/';
import 'cartIcon.dart';
//import 'vegLayout.dart';
import 'MainLayout.dart';
import '../globals.dart' as glob;
import '../drawer/NevItem.dart';

class HomePage extends StatelessWidget {
  final String data;
  HomePage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: NevItem(),
          elevation: 3,
          
        ),

        appBar: AppBar(
          
          title: Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.tealAccent,
          actions: <Widget>[
            IconButton(
              /**
               Container(
                child: Image(
                  image: AssetImage('assets/shopping.png'),
                  fit: BoxFit.cover,
                  
                ),
                height: 100,
                width: 100,
                
              )
               */
              icon: CartIcon(),
              onPressed: () {
                
              },
            ),
          ],
          
          /*leading: new IconButton(
            icon: new Icon(Icons.menu, color: Colors.black),
            onPressed: () => null, //Navigator.pop(context),
          ),*/
          //trailing:
        iconTheme: new IconThemeData(color:Colors.black),
        ),
        body:MainLayout() ,
      ),
    );
  }
}
