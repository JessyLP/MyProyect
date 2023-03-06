import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuarioView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: 300,
            height: 150,
            child: Image(
              width: 100,
              height: 100,
              image: AssetImage('assets/images/usuario.png'),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepPurpleAccent.withOpacity(0.4)
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.all(20),
            width: 300,
            height: 150,
            child: Text("Informacion"),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepPurpleAccent.withOpacity(0.4)
            ),
          )
        ],
      ),
    );
  }

}