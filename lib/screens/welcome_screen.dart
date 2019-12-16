import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: prefix0.theme,
      home: Scaffold(
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/home-logo.png'),
              ),
              SizedBox(
                height: 100.0,
              ),
              FlatButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    letterSpacing: 3.0,
                    fontSize: 18.0
                  ),
                ),
                
                
                color: Colors.deepOrange,
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 80.0
                ),
                onPressed: () {Navigator.of(context).pushNamed('/login');},
              ),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    letterSpacing: 3.0,
                    fontSize: 18.0
                  ),
                ),
                color: Colors.deepOrange,
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 60.0
                ),
                onPressed: () {Navigator.of(context).pushNamed('/signup');},
              )
            ],
          ),
        ),
      )
      
      
      
    );
  }
}