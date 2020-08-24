import 'dart:typed_data';
import 'package:fit_to_fab/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:fit_to_fab/DataHolder.dart';

class Connectt extends StatelessWidget {

  Widget makeImageGrid(){
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context,index){
        return ImageGridItem(index+1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
          ),

          title: Text("CONNECTT",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: headerFont,
          ),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () {Navigator.of(context).pushNamed('/photoUpload');},
            ),
          ],
          
        ),
        

        body: Container(
          child: makeImageGrid(),
        ),
      );
  }
}

class ImageGridItem extends StatefulWidget {
  int _index;

  ImageGridItem(int index){
    this._index = index;
  }


  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List imageFile;
  Icon favorite = Icon(Icons.favorite_border);
  Text follow = Text('FOLLOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.deepOrange.shade700
                  ),
                );
  StorageReference PhotosReference = FirebaseStorage.instance.ref().child('Blog_images');

  int MAXSIZE = 7*1024*1024;
  getImage(){
    if(!requestedIndex.contains(widget._index)){
      PhotosReference.child('image_${widget._index}.jpg').getData(MAXSIZE).then((data){
      this.setState((){
        imageFile = data;
      });
      imageData.putIfAbsent(widget._index, (){
        return data;
      });
    }).catchError((error){
      debugPrint(error.toString());
    });
    requestedIndex.add(widget._index);
    }
  }

  Widget decideGridTileWidget(){
    if(imageFile == null){
      return Center(
        child: Text('Image being loaded...'),
      );
    }else{
      return Image.memory(imageFile,fit: BoxFit.cover,);
    }
  }

  @override
  void initState() {
    super.initState();
    if(!imageData.containsKey(widget._index)){
      getImage();
    }else{
      this.setState((){
        imageFile = imageData[widget._index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      
      header: Row(
        
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.0,
                  
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Jessica Jhones',
                        style: TextStyle(
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text('Newyork',
                        style: TextStyle(
                          fontSize: 10.0
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 70.0,
                ),
                FlatButton(
                  child: follow,
                  onPressed: (){
                    setState(() {
                      follow = Text('FOLLOWING',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.blueAccent
                        ),
                      );
                    });
                  },
                )
              ],
            ),
      child: Container(
      // color: Colors.deepOrange,
      child: Column(
        children: <Widget>[
          Padding(
           padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            height: 300.0,
            width: 400.0,
            child: decideGridTileWidget(),
          ),
          SizedBox(
            height: 0.0,
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: favorite,
                  onPressed: (){
                    setState(() {
                      favorite = Icon(
                        Icons.favorite,
                        color: Colors.red,
                      );
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.insert_comment),
                  onPressed: (){},
                )
                
              ],
            ),
          ),
          // SizedBox(
          //   height: 10.0,
          // ),
        ],
      ),
    ),
    );
  }
}