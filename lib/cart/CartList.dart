import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../globals.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  ProgressDialog pr;
  List vegListData;

  Future deleteEntery(String id) async {
    try {
     // pr.show();
      var url = 'https://devlopeme.000webhostapp.com/cartDel.php?id='+id;

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

  Future getVeg(String id) async {
    var url = 'https://devlopeme.000webhostapp.com/cart.php?id='+id.toString();
    print('inGetVeg()1');
    try {
      pr.show();
      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      print('inGetVeg()2');
      if (response.statusCode == 200) {
        String responseBody = response.body;
        var resJson = json.decode(responseBody); //json.encode()
        //Fact fact=Fact.fromJson(resJson[0]);
        //vegListData=resJson[""];
        setState(() {
          vegListData = resJson;
          print(vegListData.length);
        });
        pr.hide();
        // pr.hide().then((isHidden) {
        //   print(isHidden);
        // });

        //print(resJson);

        //resJson['f_id']
      }
    } catch (err) {
      pr.hide();
      // pr.hide().then((isHidden) {
      //   print(isHidden);
      // });
      print(err.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getVeg(usid));
  }

  Widget coListView() {
    return Container(
      child: ListView.builder(
        itemCount: vegListData == null ? 0 : vegListData.length,
        itemBuilder: (BuildContext cnts, int index) {
          return Container(
            padding: EdgeInsets.all(3),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      vegListData[index]["v_name"].toString().toUpperCase(),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\u20B9 " + vegListData[index]["v_price"],
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),

                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Quentity: " + vegListData[index]["v_qty"],
                      textAlign: TextAlign.left,
                    ),
                  ],
                ), //Random().nextInt(10).toString()),
                trailing: new IconButton(
                  icon: new Icon(Icons.close, color: Colors.black),
                  onPressed: () => {
                    deleteEntery(vegListData[index]["id"]),
                    
                    getVeg(usid),
                  
                    //  veg.removeAt(index)
                  },
                ),
              ),
            ),
          );
        },
      ),
    ); /*in code Bottum*/
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    return coListView();
  }
}
