
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Customs/HexColor.dart';
import 'PersonalPhotos/FormView.dart';

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
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.4, 0.7, 0.9],
              colors: [
                HexColor("#4b4293").withOpacity(0.8),
                HexColor("#4b4293"),
                HexColor("#08418e"),
                HexColor("#08418e")
              ],
            ),
              image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
              HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage('assets/images/mar.gif'),
            ),
          ),
        ),

      appBar: AppBar(
        title: const Text('Tus Fotos',textAlign: TextAlign.center),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        hoverColor: Colors.white,
        //foregroundColor: Colors.black,
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new FormView(),
            ),
          );
          //Navigator.of(context).popAndPushNamed("/images");
        },
        child: Icon(Icons.add,size: 20),
      ),
    );
  }
}