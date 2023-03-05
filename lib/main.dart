import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_proyect/BarMenu.dart';
import 'package:my_proyect/Views/GridView/Calculo.dart';
import 'package:my_proyect/Views/GridView/Memory.dart';
import 'package:my_proyect/Views/GridView/Quiz/Quiz.dart';
import 'package:my_proyect/Views/SplashView2.dart';
import 'Firebase/singleton/DataHolder.dart';
import 'Views/HomeView.dart';
import 'Views/LoginView.dart';
import 'Views/PersonalPhotos/FormView.dart';
import 'Views/RegisterView.dart';
import 'Views/SplashView.dart';
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
  //const MyApp({super.key});

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
        initialRoute: '/home',
        routes: {
          '/login' : (context) => LoginView(),
          '/register' : (context) => RegisterView(),
          '/splash' : (context) => SplashView(),
          '/splash2' : (context) => SplashView2(),
          '/home' :  (context) =>  HomeView(),
          '/bar' :  (context) =>  BarMenu(),
          '/images' :  (context) =>  FormView(),


          '/memory' :  (context) =>  Memory(),
          '/quiz' :  (context) =>  Quiz(),
          '/cal' :  (context) =>  Calculo(),
        },
      );
    }
    else{
      materialAppMobile=MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: '/splash2',
        routes: {
          '/login' : (context) => LoginView(),
          '/register' : (context) => RegisterView(),
          '/splash' : (context) => SplashView(),
          '/splash2' : (context) => SplashView2(),
          '/home' :  (context) =>  HomeView(),
          '/bar' :  (context) =>  BarMenu(),
          '/images' :  (context) =>  FormView(),


          '/memory' :  (context) =>  Memory(),
          '/quiz' :  (context) =>  Quiz(),
          '/cal' :  (context) =>  Calculo(),


        },
      );
    }
    //print("La PLATAFORMA ES ..... --> "+DataHolder().platformAdmin.isAndroidPlatform().toString());

    return materialAppMobile;

  }
}