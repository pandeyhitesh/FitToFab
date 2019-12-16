import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:fit_to_fab/widgets/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email ;
  String password ;
  bool showSpinner = false;

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
                  hintText: 'Enter email id'
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
                    color: Colors.deepOrange,
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
                colour: Colors.deepOrange,
                buttonName: 'SIGN IN',
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if(user != null){
                      Navigator.of(context).pushNamed('/dashboard');
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to Fit to Fab?',
                      style: TextStyle(
                        letterSpacing: 1.1,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {Navigator.of(context).pushNamed('/signup');},
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
// >=2.1.0 <3.0.0



