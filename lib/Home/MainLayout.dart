import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_dialog/progress_dialog.dart';

import './CartIcon.dart' as ab;

import '../globals.dart' as cartVal;

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List vegListData;

  ProgressDialog pr;

  Future addVeg(String nm, String pr, String qt) async {
    print('inaddVegWebCall()');

    if (nm != '' && pr != '' && qt != '') {
      print('inaddVegWebCall()');
      var url = 'https://devlopeme.000webhostapp.com/insertCart.php?nm=' +
          nm +
          '&qty=' +
          qt +
          '&pr=' +
          pr +
          '';
      var Response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (Response.statusCode == 200) {
        String responseBody = Response.body;
        var resJson = json.decode(json.encode(responseBody));
        print(resJson);
        setState(() {
          cartVal.cart = cartVal.cart + 1;
          //ab.CartIcon.
        });
      }
    } else {
      print('Empty Var');
    }
    //print(response.body);
    //var data =jsonDecode(response.body);
    //print(data.toString());
  }

  Future getVeg() async {
    var url = 'https://devlopeme.000webhostapp.com/get.php';
    print('inGetVeg()1');
    try {
      pr.show();

      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      print('inGetVeg()2 ');
      if (response.statusCode == 200) {
        String responseBody = response.body;
        var resJson = json.decode(responseBody); //json.encode()
        //Fact fact=Fact.fromJson(resJson[0]);
        //vegListData=resJson[""];
        setState(() {
          vegListData = resJson;
          print(vegListData.length);
          print(vegListData);
        });
        pr.hide();
        // pr.hide().then((isHidden) {
        //   print(isHidden);
        // });

        //print(resJson);

        //resJson['f_id']
      }
    } catch (err) {
      // pr.hide().then((isHidden) {
      //   print(isHidden);
      // });
      print(err.toString());
      pr.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    //pr.show();
    WidgetsBinding.instance.addPostFrameCallback((_) => getVeg());
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    return Container(
      child: GridView.builder(
          itemCount: vegListData == null ? 0 : vegListData.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            //print(vegListData[index]["vegImg"].toString());
            return Container(
              decoration: BoxDecoration(),
              //border: Border.all(width: 2.0, color: Colors.black)),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onLongPress: () {
                    addVeg(
                        vegListData[index]["v_name"].toString().toUpperCase(),
                        vegListData[index]["v_price"].toString().toUpperCase(),
                        1.toString());
                  },
                  child: GridTile(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width * 0.30,
                            child: Card(
                              clipBehavior: Clip.antiAlias,

                              //height: MediaQuery.of(context).size.width * 0.15,
                              child: vegListData[index]["vegImg"]==""
                                  ? new Image.asset("assets/image/diet.png",
                                      fit: BoxFit.fill)
                                  : Image.network(
                                      vegListData[index]["vegImg"].toString(),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Text(
                              vegListData[index]["v_name"]
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              "\u20B9 " +
                                  vegListData[index]["v_price"]
                                      .toString()
                                      .toUpperCase(),
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ), //Text(index.toString()),
            );
          }),
    );
  }
}
