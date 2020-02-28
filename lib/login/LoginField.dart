import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
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
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: "",
                labelText: 'Username',
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
              Navigator.of(context).pushNamed(
                '/home',
                arguments: 'ON HomePage',
              );
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
      ],
    );
  }
}
