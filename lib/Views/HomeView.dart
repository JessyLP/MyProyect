import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_proyect/Views/GridView/Calculo/Calculo.dart';
import 'package:my_proyect/Views/GridView/Memory/Memory.dart';
import 'package:my_proyect/Views/GridView/Quiz/Quiz.dart';

import '../Customs/HexColor.dart';
import '../Firebase/Perfil.dart';
import '../Firebase/Room.dart';
import '../Firebase/singleton/DataHolder.dart';



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
   // Navigator.of(context).pushNamed("/Games");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Rooms'),
        backgroundColor: Colors.black,
      ),*/
      backgroundColor: Colors.lightBlue,


      body: Container(
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
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage('assets/images/mar.gif'),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: <Widget>[
                    const SizedBox(
                      height: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      //color: Colors.teal[100],
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/memorizar1.png'),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Memory(),
                            ),
                          );
                          //Navigator.of(context).popAndPushNamed("/memory");
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(8),
                          child: const Text("MEMORIZA",style: TextStyle(fontSize: 20,backgroundColor: Colors.black,color: Colors.white),),
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.teal[200],
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/cal1.png'),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Calculo(),
                            ),
                          );
                          //Navigator.of(context).popAndPushNamed("/cal");
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(8),
                          child: const Text('CALCULO',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,backgroundColor: Colors.black,color: Colors.white),),
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.teal[300],
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/quiz1.png'),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Quiz(),
                            ),
                          );
                          //Navigator.of(context).popAndPushNamed("/quiz");
                          },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(8),
                          child: const Text('QUIZ',style: TextStyle(fontSize: 20,backgroundColor: Colors.black,color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}























      /*body: Center(
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
}*/