

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class App extends StatelessWidget {

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "JBrain or Kakapp",
        initialRoute: '/splashview',
        routes: {
         /* '/home' :  (context) =>  HomeView(),
          '/loginview' : (context) => LoginView(),
          '/registerview' : (context) => RegisterView(),
          '/onBoardingview' : (context) => OnBoardingView(),
          '/splashview' : (context) => SplashView(),
*/
        }

    );
  }
}
