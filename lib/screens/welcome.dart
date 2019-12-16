import 'package:fit_to_fab/constants.dart' as prefix0;

// import 'login.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 2),() {Navigator.of(context).pushNamed('/login');});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: prefix0.theme,
      home: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 160.0),
                      ),
                      Image.asset('assets/images/home-logo.png'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    
                    Text(
                      " Fitness app\nfor everyone!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        letterSpacing: 3.0
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}

// CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 50.0,
//                         child: Icon(
//                           Icons.fitness_center,
//                           color: Colors.blue,
//                           size: 50.0,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 25.0),
//                       ),
//                       Text(
//                         "Fit To Fab", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
//                       )