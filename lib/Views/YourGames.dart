
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
    backgroundColor: Colors.blueGrey,
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple.shade900,
      selectedItemColor: Colors.blueAccent.shade200,
      unselectedItemColor: Colors.white12.withOpacity(.60),
      /*selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,*/
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Quiz"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Tus Juegos"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "User")
      ],
    ),
  );
}
}