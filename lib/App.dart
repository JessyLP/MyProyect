

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Views/LoginView.dart';
import 'Views/SplashView.dart';


class App extends StatelessWidget {

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "JBrain or Kakapp",
        initialRoute: '/splashview',
        routes: {
          '/loginview' : (context) => LoginView(),
          '/splashview' : (context) => SplashView(),
         /* '/home' :  (context) =>  HomeView(),

          '/registerview' : (context) => RegisterView(),
          '/onBoardingview' : (context) => OnBoardingView(),

*/
        }

    );
  }
}
