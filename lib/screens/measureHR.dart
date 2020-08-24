import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
// import 'package:flutter/services.dart';
class MeasureHR extends StatefulWidget {
  @override
  _MeasureHRState createState() => _MeasureHRState();
}

class _MeasureHRState extends State<MeasureHR> {
  // final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;

  String heartRate = '90';

  void getReading()async{
    var rng = new Random();
    int i = rng.nextInt(21);
    final reading = await _fireStore.collection('heartrate').getDocuments();
    var hr = reading.documents;
    var dtl = hr[i].data;
    setState(() {
      heartRate = dtl['reading'];
    });
    
  }
  
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
              child: Image(image: AssetImage('assets/images/home-logo.png'),),
              margin: EdgeInsets.only(
                top: 90.0,
              ),
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Colors.deepOrange,
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(
                top: 40.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                SizedBox(
                  width: 25.0,
                ),
                Text(heartRate,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3.0,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('BPM',
                  style: TextStyle(
                    fontSize: 10.0,
                    letterSpacing: 2.0
                  ),
                ),
              ],),
              
              height: 80.0,
              width: 250.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green.shade800,
              ),
            ),
            FlatButton(
              onPressed: getReading,
              
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
