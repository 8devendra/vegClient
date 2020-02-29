import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_dialog/progress_dialog.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List vegListData;
  ProgressDialog pr;
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
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(),
              //border: Border.all(width: 2.0, color: Colors.black)),
              child: Card(
                elevation: 5,
                child: GridTile(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 90,
                        child: new Image.asset(
                          "assets/image/diet.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        child: Text(
                          vegListData[index]["v_name"].toString().toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text("\u20B9 " +
                          vegListData[index]["v_price"].toString().toUpperCase(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                )),
              ), //Text(index.toString()),
            );
          }),
    );
  }
}
