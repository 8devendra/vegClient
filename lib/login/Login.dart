import 'package:flutter/material.dart';
import './LoginField.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 140),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Image.asset(
                'assets/image/diet.png',
                width: 150,
                fit: BoxFit.cover,
                alignment: new Alignment(-1.0, -1.0),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontWeight: FontWeight.w400,
                  fontSize: 45,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      offset: Offset(0.5, 6),
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Fresh Vegitable to you..',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            LoginField(),

            ///
            ///
            ///
          ],
        ),
      ),
    );
    /* ;*/
  }
}
