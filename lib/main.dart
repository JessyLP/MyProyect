import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_proyect/Views/SplashView.dart';
import 'package:my_proyect/Views/UsuarioView.dart';
import 'BarMenu.dart';
import 'Firebase/singleton/DataHolder.dart';
import 'Views/HomeView.dart';
import 'Views/LoginView.dart';
import 'Views/PersonalPhotos/FormView.dart';
import 'Views/RegisterView.dart';
import 'firebase_options.dart';


import 'App.dart';
void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp ({Key?key}):super (key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    MaterialApp materialAppMobile=const MaterialApp();

    if(DataHolder().platformAdmin.isAndroidPlatform() ||
        DataHolder().platformAdmin.isIOSPlatform()){
      //print("ENTRO EN ANDROID O IOS");
      materialAppMobile=MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'JBrain or Kakapp',
        initialRoute: '/bar',
        routes: {
          '/login' : (context) => LoginView(),
          '/register' : (context) => RegisterView(),
          '/splash' : (context) => SplashView(),
          '/home' :  (context) =>  HomeView(),
          '/bar' :  (context) =>  BarMenu(),
          '/formulario' :  (context) =>  FormView(),

        },
      );
    }
    else{
      materialAppMobile=MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: '/bar',
        routes: {
          '/login' : (context) => LoginView(),
          '/register' : (context) => RegisterView(),
          '/splash' : (context) => SplashView(),
          '/home' :  (context) =>  HomeView(),
          '/usuario':(context)=> UsuarioView(),
          '/bar' :  (context) =>  BarMenu(),
          '/formulario' :  (context) =>  FormView(),

        },
      );
    }
    return materialAppMobile;

  }
}
