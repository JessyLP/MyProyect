
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Customs/HexColor.dart';

class YourGames extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _YourGames();
  }
}


class _YourGames extends State<YourGames>{
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Fotos',textAlign: TextAlign.center),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),

    floatingActionButton: FloatingActionButton(
      backgroundColor:  Colors.purpleAccent[100],
      hoverColor: Colors.white,
      //foregroundColor: Colors.black,
      mini: true,
      onPressed: () {
        Navigator.of(context).pushNamed("/formulario");
      },
      child: Icon(Icons.add,size: 20),
    ),
  );
}
}