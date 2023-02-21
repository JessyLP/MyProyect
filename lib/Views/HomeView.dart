import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Firebase/Perfil.dart';
import '../Firebase/Room.dart';
import '../Firebase/singleton/DataHolder.dart';
import 'GridViewHome/RoomCard.dart';


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
        title: const Text('Rooms'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
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
      ),
      //bottomNavigationBar: BarMenu()
    );
  }
}