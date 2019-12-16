import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:fit_to_fab/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: prefix0.theme,

      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/images/home-logo.png'),
              SizedBox(
                height: 70.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: prefix0.kInputTextFieldDecoration.copyWith(
                  hintText: 'Enter email id',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.lightGreen,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                ),
                onChanged: (value){
                  email = value;
                },
              ), 
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: prefix0.kInputTextFieldDecoration.copyWith(
                  hintText: 'Enter password',
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.lightGreen,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  
                ),
                onChanged: (value){
                  password = value;
                },
              ),
              
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                colour: Colors.lightGreen.shade500,
                buttonName: 'SIGN UP',
                
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  // print(email);
                  // print(password);
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if(newUser != null){
                      Navigator.pushNamed(context,'/personalDetails');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }catch(e){
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: 0.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        letterSpacing: 1.1,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {Navigator.of(context).pushNamed('/login');},
                    )
                  ],
                )
              ),
            ],
          ),
        ),
        )
      ),
    );
  }
}