import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Customs/HexColor.dart';
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
        Navigator.of(context).popAndPushNamed("/bar");
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
                image: AssetImage('assets/images/fondo.gif'),
              ),
            ),
            child:
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
              //  Image.asset('assets/images/BM.gif',height: 200,),
                Image.asset('assets/images/logoCer.png',height: 200,),
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/loginLlama.gif',height: 100),
                Text("Please, wait some seconds...                                                                    "
                  , textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,),),
              ],
            )
        )
    );
  }
}