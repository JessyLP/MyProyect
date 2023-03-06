
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Customs/HexColor.dart';

class YourPhotos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _YourPhotos();
  }
}


class _YourPhotos extends State<YourPhotos>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,

      appBar: AppBar(
        title: const Text('Tus Fotos',textAlign: TextAlign.center),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        hoverColor: Colors.white,
        //foregroundColor: Colors.black,
        mini: true,
        onPressed: () {
          Navigator.of(context).popAndPushNamed("/images");
        },
        child: Icon(Icons.add,size: 20),
      ),
    );
  }
}