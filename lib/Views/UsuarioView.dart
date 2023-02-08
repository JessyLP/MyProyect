import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuarioView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 200),
            width: 500,
            height: 450,
            child: Text("PERFIL DEL USUARIO + LOGIN / REGISTER"),
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