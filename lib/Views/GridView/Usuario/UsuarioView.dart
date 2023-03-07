
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_proyect/Views/GridView/Usuario/CambiarNombre.dart';

import '../../../Customs/HexColor.dart';



class UsuarioView extends StatefulWidget{

  @override
  State<UsuarioView> createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  /*
  late RFInputPerfil inputUser= RFInputPerfil(
    nombre: 'NOMBRE',
  );

  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Perfil> collectionPerfiles= [];

  @override
  void initState() {
    super.initState();

    getPerfiles();
  }

  void getPerfiles()async{
    final docRef = db.collection("perfiles").withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil cards, _) => cards.toFirestore());

    final docSnap= await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        collectionPerfiles.add(docSnap.docs[i].data());
      }
    });
  }

   */

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil',textAlign: TextAlign.center),
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
        padding: const EdgeInsets.only(bottom: 300,left: 30,right:40 ,top:120 ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 3,
              color: Colors.white
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
                      image: AssetImage('assets/images/person.png'),
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Text("Invitado",style: TextStyle(fontSize: 20,color: Colors.white),),
              /*const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new CambiarNombre(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent
                  ),
                  child: const Text("Editar",style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),*/




              const SizedBox(height: 30),
              const SizedBox(height: 10),

              //Menu herramientas:
              RawMaterialButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('¿Quieres borrar tu perfil?'),
                      content: const Text('Lo siento esta funcion todavia no esta disponible. :D'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'NO'),
                          child: const Text('NO'),
                        ),
                      ],
                    ),
                  );
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.settings,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              //ProfileMenuWidget(icon: Icons.settings,title: "Settings" ,textColor:Colors.white ,endIcon: true, onPress: () {  },),
              const SizedBox(height: 20),
              RawMaterialButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('¿Tienes problemas?'),
                      content: const Text('Si tiene algún problema, póngase en contacto con nosotros con el siguiente correo: "correo@gmail.com"'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.info,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              //ProfileMenuWidget(icon: Icons.info,title: "Information" ,textColor:Colors.white ,endIcon: true, onPress: () {  },),
              const SizedBox(height: 20),

              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/login");
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.logout,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              const SizedBox(
                height: 20,
              ),
              //ProfileMenuWidget(icon: Icons.logout,title: "Log out" ,textColor:Colors.deepOrangeAccent[100] ,endIcon: false, onPress: () {  },),
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

