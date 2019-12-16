import 'package:flutter/material.dart';

final theme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFF0A0E21),
  accentColor: Colors.deepOrange,
  scaffoldBackgroundColor: Color(0xFF0A0E21),

);

final backgroundColor = Color(0xFF0A0E21);
final profileNameTextStyle = TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.0,
                        );
final profileValueTextStyle = TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                          fontSize: 20);
final textStyle = TextStyle(color: Colors.white, fontSize: 22,letterSpacing: 2.0,fontWeight: FontWeight.w500);
final headerFont = 'Pacifico';
final bodyFont = 'Source Sans Pro';

final kInputTextFieldDecoration = InputDecoration(
                  hintText: 'Enter email id',
                  
                  hintStyle: TextStyle(letterSpacing: 3.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepOrange,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  )
                );