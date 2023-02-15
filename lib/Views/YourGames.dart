
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
      title: const Text('Rooms'),
      backgroundColor: HexColor("#08418e"),


    ),

  );
}
}