import 'package:flutter/material.dart';

import 'Views/HomeView.dart';
import 'Views/UsuarioView.dart';

late String text="TEXTO DE PRUEBA";

class BarMenu extends StatefulWidget{

  const BarMenu({Key? key}): super(key: key);

  @override
  State<BarMenu> createState() => _BarMenu();
}

class _BarMenu extends State<BarMenu> {

  int _paginaIndex=0;

  List<Widget> _paginas=[
    HomeView(),
    //favoritos(),
    //mensajes(),
    UsuarioView(),
  ];

  //PARTE VISUAL
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: " ",
        home: Scaffold(
          appBar: AppBar(// BARRA SUPERIOR CON LA BUSUEDA + FILTROS
            backgroundColor: Colors.purple.shade900,
            leading: Icon(Icons.menu, color: Colors.white),
            actions: [
              //Icon(Icons.search),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search, color: Colors.grey,),
              ),
              Icon(Icons.more_vert, color: Colors.grey,),
            ],
          ),
          body: _paginas[_paginaIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple.shade900,
            selectedItemColor: Colors.blueAccent.shade200,
            unselectedItemColor: Colors.white12.withOpacity(.60),
            /*selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,*/
            currentIndex: _paginaIndex,
            onTap: (index){
              setState((){
                _paginaIndex= index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
              //BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "FAV"),
              //BottomNavigationBarItem(icon: Icon(Icons.message),label: "MENSAJES"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "PERFIL")
            ],
          ),
        )
    );
  }
}