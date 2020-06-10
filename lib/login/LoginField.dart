import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../globals.dart';
import 'dart:io';

class LoginField extends StatelessWidget {
  TextEditingController tecEmail = new TextEditingController();
  TextEditingController tecPass = new TextEditingController();
  String id;
  Future getUser(String email, String passs) async {
    var url = 'https://devlopeme.000webhostapp.com/login.php?email=' +
        email.toString() +
        '&pass=' +
        passs.toString();
        print(url);
    print('inGetUser()1');
    try {
      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      print('inGetUser()2');
      if (response.statusCode == 200) {
        String responseBody = await response.body;
        id = responseBody;
        print('kasle'+responseBody);
        //usid = responseBody;
        usid=responseBody==''?'0':responseBody;
        //var resJson = json.decode(responseBody); //json.encode()
        //Fact fact=Fact.fromJson(resJson[0]);
        //vegListData=resJson[""];

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
              //color: const Color(0xFF66BB6A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 4),
                  blurRadius: 10,
                ),
              ]),
          child: TextField(
            controller: tecEmail,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: "",
                labelText: 'Email',
                fillColor: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
              //color: const Color(0xFF66BB6A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 4),
                  blurRadius: 10,
                ),
              ]),
          child: TextField(
            obscureText: true,
            controller: tecPass,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: "Password",
                labelText: 'Password',
                fillColor: Colors.white),
          ),
        ),

        //flat button
        Container(
          child: FlatButton(
            onPressed: () {
              /*...*/
            },
            child:
                Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
          ),
        ),
        //flatbutton
        //const SizedBox(height: 30),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
              borderRadius: BorderRadius.circular(80.0),
              //color: const Color(0xFF66BB6A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 4),
                  blurRadius: 10,
                ),
              ]),
          child: RaisedButton(
            onPressed: () {
              //

              // print(tecEmail.text.toString()+''+tecPass.text.toString());

              if (tecEmail.text == '' && tecPass.text == '') {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Enter Email And Password..')));
              } else {
                print(tecEmail.text.toString() + '' + tecPass.text.toString());
                getUser(tecEmail.text, tecPass.text);
                sleep(const Duration(seconds: 1));
                print('convert '+int.parse(usid).toString());
                if (int.parse(usid) > 0) {
                  Navigator.of(context).pushNamed(
                    '/home',
                    arguments: id.toString(),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Enter Valid Email and Password..')));
                }

                /*
                 
                if(usid==''){
                if (usid == 'Empty Resp') {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Enter Email And Password..')));
                  print('empty');
                } else {
                  if(usid.isNotEmpty){
                    print('Loing Fild Empty Responce');
                 
                  }else{
                     Navigator.of(context).pushNamed(
                    '/home',
                    arguments: id.toString(),
                  );
                  }
                }
                }else{
                  print('blanck');
                }*/
              }
              /**/

              ///
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 50.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),

        Container(
          child: FlatButton(
            onPressed: () {
              /*...*/
              Navigator.of(context).pushNamed(
                '/crtu',
                arguments: 'ON HomePage',
              );
            },
            child:
                Text("New User?", style: TextStyle(color: Colors.green[300])),
          ),
        ),
      ],
    );
  }
}
