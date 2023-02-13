
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
    body: Center(
      child:
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: chatRooms.length,
          itemBuilder: (BuildContext context, int index) {
            return RoomCard(ImgUrl:chatRooms[index].image!,Name :chatRooms[index].name!, onShortClick: listItemShortClicked,index: index,);
          }
      ),
    ),
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