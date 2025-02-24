import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.buttonName, this.colour, @required this.onPressed});
  final Color colour;
  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 50.0,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 16.0
            ),
          ),
        ),
      ),
    );
  }
}