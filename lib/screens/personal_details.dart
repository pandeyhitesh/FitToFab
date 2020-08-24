// import 'dart:html';

import 'package:fit_to_fab/constants.dart';
import 'package:fit_to_fab/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;
  FirebaseUser loggedInUser;
  String name;
  num age;
  num weight;
  num height;
  String BMI;
  
  

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.close,
              color: Colors.white,

            ),
          ),

          title: Text("PERSONAL DETAILS",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: headerFont,
          ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.center,
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText: 'Enter Full Name',
                    prefixIcon: Icon(
                      Icons.create,
                      color: Colors.deepOrange,
                    )
                  ),
                  onChanged: (value){
                    name = value;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText:'Enter Age',
                    prefixIcon: Icon(
                      Icons.confirmation_number,
                      color: Colors.deepOrange,
                    )
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (value){
                    age = num.parse(value);
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText:'Enter Weight',
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.deepOrange,
                    )
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (value){
                    weight = num.parse(value);
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText:'Enter Height',
                    prefixIcon: Icon(
                      Icons.arrow_upward,
                      color: Colors.deepOrange,
                    )
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (value){
                    height = num.parse(value);
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                RoundedButton(
                  buttonName: 'SAVE',
                  colour: Colors.deepOrange,
                  onPressed: () {
                    num BMI = weight/(height/100);
                    print(BMI.round());
                    _fireStore.collection("users").add({
                      'name': name,
                      'age' : age,
                      'height' : height,
                      'weight' : weight,
                      'email' : loggedInUser.email,
                      'BMI' : BMI.round().toString()
                    });
                    Navigator.pushNamed(context,'/dashboard');
                  },
                  
                )
              ],
            ),
            
          )
        ),
      ),
    );
  }
}