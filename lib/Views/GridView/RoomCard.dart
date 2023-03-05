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
        color: Colors.purple,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(ImgUrl,width: 150,height: 150),
            const SizedBox(height: 10,),
            Text(Name,style: const TextStyle(color: Colors.black ,
                shadows: <Shadow>[
                  Shadow(
                  offset: Offset(10.0, 10.0),
                    blurRadius: 7.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}