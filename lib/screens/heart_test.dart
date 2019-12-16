import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';

class HeartTest extends StatelessWidget {
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

          title: Text("HEART TEST",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: prefix0.headerFont
          ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,horizontal: 10.0,
          ),
          
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Phases(
                'PHASE 1', 
                'While sitting idle',
                'assets/images/hearttest1.png'
              ),
              Phases(
                'PHASE 2', 
                'While talking',
                'assets/images/hearttest2.png'
              ),
              Phases(
                'PHASE 3', 
                'While walking',
                'assets/images/hearttest3.png'
              ),
              Container(
                child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 50.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0) ,
                      color: Colors.blue.shade900,

                    ),
                    child: Text(
                      'Status : GOOD',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.lightGreenAccent,
                      
                      fontSize: 18.0),
                  
                      ),
                
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Phases extends StatelessWidget {
  Phases(@required this.phaseNo, @required this.phaseText, @required this.imageURL);
  final String phaseNo;
  final String phaseText;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal,),
          child: Column(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 400.0,
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0),
                child: Text(
                  phaseText,
                  style: 
                    TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                          fontSize: 15),
                 
                  textAlign: TextAlign.left,
                ),
              ),
              Image(
                image: AssetImage(imageURL),
              ),
            ],
          ),
        ),
        
        RaisedButton(
          onPressed: (){},
          
          padding: EdgeInsets.symmetric(
            horizontal: 100.0,
            vertical: 14.0,
          ),
          

          color: Colors.red,
          hoverColor: Colors.pink,
          child: Text(
            phaseNo,
            style: TextStyle(
              letterSpacing: 3.0,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
                ),
              ),

        
      ],),  
    );
  }
}