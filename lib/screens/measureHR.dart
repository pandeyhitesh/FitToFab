import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class MeasureHR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: prefix0.theme,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
          ),

          title: Text("HEART RATE",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: prefix0.headerFont
          ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 90.0,
              ),
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepOrange,
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(
                top: 40.0,
              ),
              height: 80.0,
              width: 250.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green.shade800,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                height: 90.0,
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.teal,
                ),
                child: Text(
                  'MEASURE',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
            ),
          ],),
        ),
      ),
    );
  }
}
