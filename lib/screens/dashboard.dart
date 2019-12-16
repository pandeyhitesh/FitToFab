import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fit_to_fab/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Color backgroundColor = Color(0xFF4A4A58);


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;
  FirebaseUser loggedInUser;
  Map list = {};
  String name = 'fbuj';

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
        print('Logged in User');
        print(loggedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }
  void getPersonalDetails() async{
    final personalDetails = await _fireStore.collection('users').getDocuments();

    for(var user in personalDetails.documents){
      list = user.data;
      if(list['email'] == loggedInUser.email){
        name = list['name'];
      }
    }
    
    // list = personalDetails.documents[1].data;
    // print(list);
    // print(list['email']);
  }

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
    getCurrentUser();
    getPersonalDetails();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return MaterialApp(
      theme: theme,
      home:Scaffold(

      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    ),);
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: (){Navigator.of(context).pushNamed('/profile');},
                  child: Container(
//                  color: Colors.deepOrange,
//                  height: 100.0,
                    width: 240.0,
                    decoration: BoxDecoration(color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical:30.0, horizontal: 10.0 ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('assets/images/man.png'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 45,left: 10),
                          child: Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 45),
                InkWell(

                    focusColor: Colors.red,
                    onTap:(){
                  setState(() {
                    if (isCollapsed)
                      _controller.forward();
                    else
                      _controller.reverse();

                    isCollapsed = !isCollapsed;
                  });
                },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50.0,
//                      color: Colors.deepOrange,
                      child: Text(
                          "Home", style: textStyle),
                    ),
                ),
                GestureDetector(
                  onTap: (){Navigator.of(context).pushNamed('/measureHR');},
                  child: MenuOptions(
                    pageName: 'Measure Heart rate',
                  ),),
                GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/lessons');},
                    child: MenuOptions(pageName: 'Lessons')),
                GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/heartTest');},
                    child: MenuOptions(pageName: "Heart Test")),
                GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/connectt');},
                    child: MenuOptions(pageName: 'Connectt')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context){
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Color(0x290A0E21),
//      appBar: AppBar(
//        title: Text('FIT TO FAB',textAlign: TextAlign.center,),
//        leading: Icon(
//            Icons.menu
//        ),
//      ),
          child: Container(
//            color: backgroundColor,
            padding: const EdgeInsets.only(left: 5, right: 5, top: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    InkWell(
                      child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30.0,
                      ),
                      onTap: () {
                        setState(() {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();

                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    InkWell(
                      child: Text("FIT TO FAB", style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontFamily: 'Pacifico'
                      ),),
                      onTap: () {
                        setState(() {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();

                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 1.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, '/login');
                      },
                    )
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {Navigator.of(context).pushNamed('/profile');},
                          child: ReusableCard(
                            ic: Icons.person_outline,
                            txt: 'Profile',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {Navigator.of(context).pushNamed('/measureHR');},
                          child: ReusableCard(
                            ic: Icons.favorite_border,
                            txt: '   Measure \n Heart Rate',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(

                  child: GestureDetector(
                    onTap: () {Navigator.of(context).pushNamed('/lessons');},
                    child: ReusableCard(
                      ic: Icons.spa,
                      txt: 'Lessons',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {Navigator.of(context).pushNamed('/heartTest');},
                          child: ReusableCard(
                            ic: Icons.fitness_center,
                            txt: 'Heart\n Test',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {Navigator.of(context).pushNamed('/connectt');},
                          child: ReusableCard(
                          ic: Icons.share,
                          txt: 'Connectt',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.ic,@required this.txt });
  final IconData ic;
  final String txt;



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(ic,
            size: 70.0,
            color: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              txt,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                  fontFamily: 'Source Sans Pro'
              ),
            ),
            ],
             
          ),
          // SizedBox(
          //   width: 350.0,
          // ),

        ],
      ),

      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),

      ),
    );
  }
}

class MenuOptions extends StatelessWidget {
  MenuOptions({@required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
//      color: Colors.deepOrange,
      child: Text(
          pageName,
          style: textStyle),);
  }
}


