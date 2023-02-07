import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget{

  final String ImgUrl;
  final String Name;
  final Function(int index) onShortClick;
  final int index;

  const RoomCard({Key? key, required this.ImgUrl, required this.Name,
    required this.onShortClick, required this.index}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onShortClick(index);
      },
      child: Card(
        color: Colors.cyan,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(ImgUrl),
            Text(Name)
          ],
        ),

      ),
    );
  }
}