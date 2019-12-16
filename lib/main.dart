import 'package:fit_to_fab/screens/connectt.dart';
import 'package:fit_to_fab/screens/dashboard.dart';
import 'package:fit_to_fab/screens/login.dart';
import 'package:fit_to_fab/screens/heart_test.dart';
import 'package:fit_to_fab/screens/lessons.dart';
import 'package:fit_to_fab/screens/personal_details.dart';
import 'package:fit_to_fab/screens/register.dart';
import 'package:fit_to_fab/screens/temp.dart';
import 'package:fit_to_fab/screens/welcome.dart';
import 'package:fit_to_fab/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:fit_to_fab/screens/profile.dart';
import 'package:fit_to_fab/screens/measureHR.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      //home:
      initialRoute: '/',
      routes: {
        '/signup': (context) => Register(),
        '/auth': (context) => AuthenticationScreen(),
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(),
        '/lessons': (context) => Lessons(),
        '/heartTest': (context) => HeartTest(),
        '/connectt': (context) => Connectt(),
        '/measureHR': (context) => MeasureHR(),
        '/profile' : (context) => Profile(),
        '/temp' : (context) => Temp(),
        '/personalDetails' : (context) => PersonalDetails(),
      }
      
    );
  }
}