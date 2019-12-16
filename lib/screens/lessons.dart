import 'package:fit_to_fab/constants.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:fit_to_fab/constants.dart';

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(

        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
          ),

          title: Text("LESSONS",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: prefix0.headerFont
          ),
          ),
        ),
        body: Container(
//          color: Colors.red,

          margin: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
//          height: 200.0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              LessonList(
                headings: 'Lesson 1',
                imageSet: ['assets/images/les1-1.jpg',
                  'assets/images/les1-2.jpg',
                      'assets/images/les1-3.jpg'],
              ),
              SizedBox(
                height: 30.0,
              ),
              LessonList(
                headings: 'Lesson 2',
                imageSet: ['assets/images/les1-4.jpg',
                  'assets/images/les1-3.jpg',
                  'assets/images/les1-1.jpg'],
              ),
              SizedBox(
                height: 30.0,
              ),
              LessonList(
                headings: 'Lesson 3',
                imageSet: ['assets/images/les1-2.jpg',
                  'assets/images/les1-1.jpg',
                  'assets/images/les1-4.jpg'],
              ),
              SizedBox(
                height: 30.0,
              ),
              LessonList(
                headings: 'Lesson 4',
                imageSet: ['assets/images/les1-4.jpg',
                  'assets/images/les1-2.jpg',
                  'assets/images/les1-3.jpg'],
              ),
            ],
          )
        ),
      ),
      
    );
  }
}

class Articles extends StatelessWidget {

  Articles({@required this.img});
  final String img;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(img),
//                      ListTile(
//                        title: Text('Heading 1'),
//                        subtitle: Text('subheading 1'),
//                      )
          ],
        ),
      ),
    );
  }
}

class LessonList extends StatelessWidget {
  LessonList({@required this.headings, @required this.imageSet});

  final String headings;
  final List<String> imageSet;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(

          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
              headings.toUpperCase(),style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 2.0,
            color: Colors.white
          ),
          ),
        ),
        Container(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,

            children: <Widget>[
              Articles(
                img: imageSet[0],
              ),
              Articles(
                img: imageSet[1],
              ),
              Articles(
                img: imageSet[2],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



