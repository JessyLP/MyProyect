import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_proyect/Views/SplashView.dart';

import 'App.dart';
void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp( App());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}*/