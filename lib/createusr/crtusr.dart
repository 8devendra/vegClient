import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;

class CrtUsr extends StatelessWidget {
  final String data;
  CrtUsr({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    return new MaterialApp(
        //title: 'Flutter Form Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'New Account',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.tealAccent,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: new UserPage(title: 'New Account'),
        ) // new UserPage(title: 'Flutter Form Demo'),
        );
  }
}

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  TextEditingController tedName=TextEditingController();
  TextEditingController tedDob=TextEditingController();
  TextEditingController tedPhone=TextEditingController();
  TextEditingController tedEmail=TextEditingController();
  TextEditingController tedAddress=TextEditingController();
  TextEditingController tedPin=TextEditingController();
  TextEditingController tedPass=TextEditingController();
  TextEditingController tedPassVal=TextEditingController();

  Future addUser(String un, String pn, String adds,String pin,String email,String pass) async {
    print('inaddVegWebCall()');
    print(pass);

    if (un != '' && pn != '' && adds != '' && pin != '' && email != '' && pass != '') {
      print('inaddNewUserWebCall()');
      var url = 'https://devlopeme.000webhostapp.com/newUsr.php?un=' + un +'&pn=' + pn + '&adds=' + adds + '&pin='+pin+'&email='+email+'&pass='+pass;
      print(url);
      var Response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (Response.statusCode == 200) {
        String responseBody = Response.body;
        var resJson = json.decode(json.encode(responseBody));
        print(resJson);
        //return 0;
        tedAddress.clear();
        tedDob.clear();
        tedEmail.clear();
        tedName.clear();
        tedPass.clear();
        tedPassVal.clear();
        tedPin.clear();
        //nameControler.clear();
        //qtyControler.clear();
        //priceControler.clear();
      }else{
        print('response failed');
        return 1;
      }
    } else {
      print('Empty Var');
      return 2;
    }
    //print(response.body);
    //var data =jsonDecode(response.body);
    //print(data.toString());
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    controller: tedName,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                  ),
                 ///remove
                  /*new TextFormField(
                    controller: tedDob,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),*/
                  ///remove
                  new TextFormField(
                    controller: tedPhone,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    controller: tedEmail,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new TextFormField(
                    controller: tedAddress,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.home),
                        hintText: 'Enter Address',
                        labelText: 'Address'),
                  ),
                  new TextFormField(
                    controller: tedPin,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.directions),
                      hintText: 'Enter Postal Code',
                      labelText: 'Postal Code',
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    controller: tedPass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: 'Create Password',
                      labelText: 'Password',
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    },
                  ),
                  new TextFormField(
                    obscureText: true,
                    controller: tedPassVal,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: 'Verify Password',
                      labelText: 'Password',
                    ),
                    onEditingComplete: (){
                      if(tedPass.text.toString()==tedPassVal.text.toString()){
                        Scaffold.of(this.context).showSnackBar(SnackBar(content: Text('Valid Password')));

                      }else{
                        Scaffold.of(this.context).showSnackBar(SnackBar(content: Text('Enter Valid Password')));
                        
                      }


                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: (){
                          //pr.show();
                          if(tedAddress.text==''&&
                          tedDob.text==''&&
                          tedEmail.text==''&&
                          tedName.text==''&&
                          tedPass.text==''&&
                          tedPassVal.text==''){
                            print('inif');
                              Scaffold.of(this.context).showSnackBar(SnackBar(content: Text('Fill the Value..')));
                          }else{
                            print('in else');
                            addUser(
                            tedName.text.toString(), 
                            tedPhone.text.toString(), 
                            tedAddress.text.toString(),
                            tedPin.text.toString(),
                            tedEmail.text.toString(),
                            tedPassVal.text.toString());
                          
                          

                          }

                           // pr.hide();
                        },
                      )),
                ],
              ))),
    );
  }
}

/**
 
 new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.color_lens),
                          labelText: 'Color',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                // newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
  
 */
