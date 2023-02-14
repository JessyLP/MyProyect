import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Customs/HexColor.dart';
import '../Firebase/Perfil.dart';
import '../Firebase/Room.dart';
import '../Firebase/singleton/DataHolder.dart';
import 'GridView/RoomCard.dart';


class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db=FirebaseFirestore.instance;
  String nombre="AQUI IRA EL NOMBRE";
  List<Room> chatRooms = [];


  @override
  void initState(){
    super.initState();
    getRoomsList();
  }

  void getProfile() async{
    final ref = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).withConverter(
      fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );
    final docSnap = await ref.get();
    final perfil = docSnap.data(); // Convert to Perfil object
    if (perfil != null) {
      print("---------->"+perfil.toString());
    } else {
      print("No such document.");
    }

  }

  void actualizarNombre()async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").
    doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
    DataHolder().perfil=docSnap.data()!;

    if (DataHolder().perfil != null) {
      print(DataHolder().perfil.age);
      setState(() {
        nombre=DataHolder().perfil.name!;
      });
    } else {
      print("No such document.");
    }
  }

  void getRoomsList() async{
//    final docRef = db.collection("rooms").where("members",isLessThan: 40).orderBy("members",descending: true).
    final docRef = db.collection("rooms").orderBy("members",descending: true).
    withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        chatRooms.add(docsSnap.docs[i].data());
      }
    });

  }
  void listItemShortClicked(int index){
    DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/ChatView");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz',textAlign: TextAlign.center),
        backgroundColor: Colors.purple

      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
      child:
          Container(
              child:
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: chatRooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RoomCard(ImgUrl:chatRooms[index].image!,Name :chatRooms[index].name!, onShortClick: listItemShortClicked,index: index,);
                    }
                ),
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
              borderRadius:BorderRadius.circular(10),
              //border: Border.all(color: Colors.pink,width: 2),
              boxShadow:[BoxShadow(color: Colors.purple,offset: Offset(5.0,5.0),blurRadius: 12.0)]

            ),
            padding: EdgeInsets.all(10),
            margin:  EdgeInsets.only(left: 40,right: 40,bottom: 20,top: 20),
          )

      ),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple.shade900,
      selectedItemColor: Colors.blueAccent.shade200,
      unselectedItemColor: Colors.white12.withOpacity(.60),
      /*selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,*/
        onTap: ,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Quiz"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Tus Juegos"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "User")
      ],
    ),
    );
  }
}