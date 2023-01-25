

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Views/LoginView.dart';


class App extends StatelessWidget {

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "JBrain or Kakapp",
        initialRoute: '/loginview',
        routes: {
          '/loginview' : (context) => LoginView(),
         /* '/home' :  (context) =>  HomeView(),

          '/registerview' : (context) => RegisterView(),
          '/onBoardingview' : (context) => OnBoardingView(),
          '/splashview' : (context) => SplashView(),
*/
        }

    );
  }
}
