
import 'dart:async';

import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final int postCount = 5;
final int followerCount = 11;



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;
  FirebaseUser loggedInUser;
  String email = 'loading...';
  Map userDetails;
  String name = 'loading...';
  num age = 0;
  num weight = 0;
  num height = 0;
  bool showSpinner = true;
  String BMI = '40';

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
        showSpinner = false;
        print('Logged in User in profile');
        print(loggedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  void getPersonalDetails() async{
    final personalDetails = await _fireStore.collection('users').getDocuments();

    for(var user in personalDetails.documents){
      userDetails = user.data;
      if(userDetails['email'] == loggedInUser.email){
        setState(() {
          name = userDetails['name'];
          age = userDetails['age'];
          weight = userDetails['weight'];
          height = userDetails['height'];
          email = userDetails['email'];
          BMI = userDetails['BMI'];
        });
      }
    }
    // print(name);
    // print(age);
    // print(weight);print(height);

  }
   

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getPersonalDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: prefix0.theme,
      home: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
        appBar: AppBar(
        leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
          ),

          title: Text("PROFILE",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 3.0,
            fontFamily: prefix0.headerFont
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.deepOrange,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                
              ),
              child: Column(children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/man.png'),
                ),
                Container(
                  // color: Colors.teal,
                  padding: EdgeInsets.only(top: 20.0,left: 30.0,right: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        name,
                        style: prefix0.profileNameTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        email,
                        style: prefix0.profileNameTextStyle,
                      ),
                    ],
                  ), 
                ),
                SizedBox(
                  width: 300.0,
                )
              ],),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Attributes(
                  atbName: 'Posts',
                  atbValue: postCount.toString(),
                ),
                SizedBox(
                  width: 90.0,
                ),
                Attributes(
                  atbName: 'profile',
                  atbValue: followerCount.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PersonalAttributes(
                  atbValue: age.toString(),
                  atbName: 'Age',
                  subSript: '',
                ),
                PersonalAttributes(
                  atbName: 'BMI',
                  atbValue: BMI.toString(),
                  subSript: '',
                ),
                PersonalAttributes(
                  atbName: 'Height',
                  atbValue: height.toString(),
                  subSript: 'cm',
                ),
                PersonalAttributes(
                  atbName: 'weight',
                  atbValue: weight.toString(),
                  subSript: 'kg',
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 1000,
                    percent: 0.7,
                    center: new Text(
                      "70.0%",
                      style: prefix0.profileNameTextStyle,
                    ),
                    header: Text(
                      'Daily Goal',
                      style: prefix0.profileNameTextStyle,
                    ),
                
                    footer: new Text(
                      "Cal. burned",
                      style: prefix0.profileNameTextStyle,
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
                  ),
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent: 0.8,
                    header: Text(
                      'Heart Rate',
                      style: prefix0.profileNameTextStyle,
                    ),
                    footer: Text("71 bpm",
                      style: prefix0.profileNameTextStyle,
                    ),
                    center: Icon(
                      Icons.favorite_border,
                      size: 30.0,
                      color: Colors.pink,
                    ),
                    // backgroundColor: Colors.grey,
                    progressColor: Colors.pink,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 1000,
                    
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LinearPercentIndicator(
                    width: 280.0,
                    lineHeight: 12.0,
                    percent: 0.8,
                    progressColor: Colors.red,
                    animationDuration: 1000,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(' Goals completed today',
                    style:TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                            fontSize: 10.0
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  LinearPercentIndicator(
                    width: 280.0,
                    lineHeight: 12.0,
                    percent: 0.2,
                    progressColor: Colors.orange,
                    animation: true,
                    animationDuration: 1000,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(' Goals completed this week',
                    style:TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                            fontSize: 10.0
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      ),
      )
      
    );
  }
}

class Attributes extends StatelessWidget {
  Attributes({@required this.atbName, @required this.atbValue});

  final String atbName;
  final String atbValue;


  @override
  Widget build(BuildContext context) {
    return Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        atbValue,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                          fontSize: 20,
                        )
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        atbName,
                         style: prefix0.profileNameTextStyle,   
                      ),
                    ],
                  ),
                );
  }
}

class PersonalAttributes extends StatelessWidget {
  PersonalAttributes({@required this.atbName, @required this.atbValue, @required this.subSript});

  final String atbName;
  final String atbValue;
  final String subSript;


  @override
  Widget build(BuildContext context) {
    return Container(
                  child: Column(children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            atbValue,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.0,
                              fontSize: 15,
                            ),
                          ),
                          
                          Text(
                            subSript,
                            style: TextStyle(fontSize: 10)
                            ,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        atbName,
                         style: prefix0.profileNameTextStyle,   
                      ),
                    ],
                  ),
                );
  }
}