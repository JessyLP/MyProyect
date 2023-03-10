import 'package:flutter/material.dart';
import 'package:my_proyect/Views/SplashView.dart';

import 'Views/HomeView.dart';
import 'Views/GridView/Usuario/UsuarioView.dart';
import 'Views/YourPhotos.dart';


class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenu();
}

class _BarMenu extends State<BarMenu> {

  int _paginaIndex=0;

  List<Widget> _paginas=[
    //SplashView(),
    HomeView(),
    YourPhotos(),
    UsuarioView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "JBrain or Kakapp",
        home: Scaffold(
          // appBar: AppBar(// BARRA SUPERIOR CON LA BUSUEDA + FILTROS
          //   backgroundColor: Colors.grey.shade800,
          //   elevation: 0,
          //   leading: Icon(Icons.menu, color: Colors.deepPurpleAccent.shade100),
          //   actions: [
          //     //Icon(Icons.search),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 16),
          //       child: Icon(Icons.search, color: Colors.blueAccent.shade100,),
          //     ),
          //     Icon(Icons.more_vert, color: Colors.deepPurpleAccent.shade100,),
          //   ],
          // ),
          body: _paginas[_paginaIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple.shade900,
            selectedItemColor: Colors.blueAccent.shade200,
            unselectedItemColor: Colors.white12.withOpacity(.60),
            mouseCursor: SystemMouseCursors.click,
            /*selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,*/
            currentIndex: _paginaIndex,
            onTap: (index){
              setState((){
                _paginaIndex= index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Games",),
              BottomNavigationBarItem(icon: Icon(Icons.photo_library),label: "Images"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "User")
            ],
          ),
        )

    );
  }
}