import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Firebase/Perfil.dart';
import '../Firebase/singleton/DataHolder.dart';




class SplashView2 extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _SplashView2();
  }
}

class _SplashView2 extends State<SplashView2>{
  FirebaseFirestore db=FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    isUserLogged();
  }


  Future<bool> checkPerfilExistance() async {

    final ref = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).withConverter(
      fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );
    final docSnap = await ref.get();

    return docSnap.exists;

  }


  void isUserLogged() async{
    await Future.delayed(Duration(seconds: 5));
    //FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/login");

    }
    else{
      await DataHolder().descargarMIPerfil();
      if(DataHolder().isPerfilDownloaded()==true){
        //if(await checkPerfilExistance()==true){
        Navigator.of(context).popAndPushNamed("/home");
      }else{
        Navigator.of(context).popAndPushNamed('/register');

      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/fondo.jpg'),
              ),
            ),
            child:
            Column(
              children: [
                Image.asset('assets/images/pato.gif'),
                Image.asset('assets/images/barra.gif',height: 200),
                Text("Please, wait some seconds... "),
              ],
            )
        )
    );
  }
}