import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  
  
  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState(){
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// Material(
//           animationDuration: duration,
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//           elevation: 8,
//           color: Color(0x290A0E21),
// //      appBar: AppBar(
// //        title: Text('FIT TO FAB',textAlign: TextAlign.center,),
// //        leading: Icon(
// //            Icons.menu
// //        ),
// //      ),
//           child: Container(
// //            color: backgroundColor,
//             padding: const EdgeInsets.only(left: 5, right: 5, top: 48),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [

//                     InkWell(
//                       child: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                           size: 30.0,
//                       ),
//                       onTap: () {
//                         setState(() {
//                           if (isCollapsed)
//                             _controller.forward();
//                           else
//                             _controller.reverse();

//                           isCollapsed = !isCollapsed;
//                         });
//                       },
//                     ),
//                     InkWell(
//                       child: Text("FIT TO FAB", style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 2.0,
//                           fontFamily: 'Pacifico'
//                       ),),
//                       onTap: () {
//                         setState(() {
//                           if (isCollapsed)
//                             _controller.forward();
//                           else
//                             _controller.reverse();

//                           isCollapsed = !isCollapsed;
//                         });
//                       },
//                     ),
//                     FlatButton(
//                       child: Text(
//                         'Log Out',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           letterSpacing: 1.0,
//                           color: Colors.deepOrange,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       onPressed: () {
//                         _auth.signOut();
//                         Navigator.pushNamed(context, '/login');
//                       },
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 1,
//                         child: GestureDetector(
//                           onTap: () {Navigator.of(context).pushNamed('/profile');},
//                           child: ReusableCard(
//                             ic: Icons.person_outline,
//                             txt: 'Profile',
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: GestureDetector(
//                           onTap: () {Navigator.of(context).pushNamed('/measureHR');},
//                           child: ReusableCard(
//                             ic: Icons.favorite_border,
//                             txt: '   Measure \n Heart Rate',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(

//                   child: GestureDetector(
//                     onTap: () {Navigator.of(context).pushNamed('/lessons');},
//                     child: ReusableCard(
//                       ic: Icons.spa,
//                       txt: 'Lessons',
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child:  Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 1,
//                         child: GestureDetector(
//                           onTap: () {Navigator.of(context).pushNamed('/heartTest');},
//                           child: ReusableCard(
//                             ic: Icons.fitness_center,
//                             txt: 'Heart\n Test',
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: GestureDetector(
//                           onTap: () {Navigator.of(context).pushNamed('/connectt');},
//                           child: ReusableCard(
//                           ic: Icons.share,
//                           txt: 'Connectt',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//         ),


