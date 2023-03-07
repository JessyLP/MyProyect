
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_proyect/BarMenu.dart';
import 'package:my_proyect/Views/GridView/Usuario/UsuarioView.dart';
import 'package:my_proyect/Views/GridView/Usuario/WidgetArguments.dart';

import '../../../Customs/HexColor.dart';
import '../../../Customs/InputText.dart';



class CambiarNombre extends StatefulWidget{

  @override
  State<CambiarNombre> createState() => _CambiarNombreState();
}

class _CambiarNombreState extends State<CambiarNombre> {
  InputText Nombre = InputText( titulo: "Nombre",ayuda: "De la persona de la foto.",);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Fotos',textAlign: TextAlign.center),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 300,left: 5,right:5 ,top:200 ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(
                width: 8,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(bottom: 20,left: 100,right:100 ,top:20 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage('assets/images/usuario.png'),
                        color: Colors.black26),
                  ),
                ),
                const SizedBox(height: 5),
                Nombre,
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/bar',arguments: WidgetArguments(Nombre.getText().toString()),);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent
                    ),
                    child: const Text("Aceptar",style: TextStyle(color: Colors.white,fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileIcon() => CircleAvatar(
    backgroundColor: Colors.white24,
    backgroundImage: AssetImage('assets/images/usuario.png'),
    maxRadius:40 ,
  );
}

