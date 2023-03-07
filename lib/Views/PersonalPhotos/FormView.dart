
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Customs/HexColor.dart';
import '../../Customs/InputText.dart';
import '../../Firebase/YourImages.dart';
import '../../Firebase/singleton/DataHolder.dart';



class FormView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _FormViewState();
  }
}

class _FormViewState extends State<FormView>{
  InputText Nombre = InputText( titulo: "Nombre",ayuda: "De la persona de la foto.",);

  final ImagePicker _picker = ImagePicker();
  late File imageFile;
  bool blImageLoaded=false;
  double dListHeightPorcentage=0.8;
  final storage = FirebaseStorage.instance;

  TextEditingController emailController = new TextEditingController();

  FirebaseFirestore db=FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void sendPressed(String sNuevoTexto)async {

    //INICIO DE SUBIDO DE LA IMAGEN
    String sUrl="";
    if(blImageLoaded){
      final storageRef = FirebaseStorage.instance.ref();//Apunta a la / del storage
      //final imagen1ImagesRef = storageRef.child("imagenes/avatar2.jpg");
      final imagen1ImagesRef = storageRef.child("imagenes/rooms/${DataHolder().selectedChatRoom.uid}/img_${Timestamp.now().seconds}.jpg");

      try {
        await imagen1ImagesRef.putFile(imageFile);
        sUrl=await imagen1ImagesRef.getDownloadURL();

        setState(() {
          blImageLoaded=false;
          dListHeightPorcentage=0.8;
        });

      } on FirebaseException catch (e) {
        print("DEBUG: HUBO UN ERROR EN EL ENVIO DE LA IMAGEN: $e");
        // ...
      }
    }
    //FIN DE SUBIDO DE LA IMAGEN

    //INICIO DE INSERCION DEL NUEVO MENSAJE EN LA BASE DE DATOS
    String path=DataHolder().COLLECTION_PERFILES_NAME+"/"+
        DataHolder().selectedPerfil.uid+"/fotos";

    final docRef = db.collection(path);

    // FBText nuevoMensaje=FBText(text:sNuevoTexto,
    //     author: FirebaseAuth.instance.currentUser?.uid,time: Timestamp.now(),imgUrl: sUrl);

    //await docRef.add(nuevoMensaje.toFirestore());
    //FIN DE INSERCION DEL NUEVO MENSAJE EN LA BASE DE DATOS
    //descargarTextos();

  }


  void btn1Pressed(BuildContext context) async {
    YourImages yimages= new YourImages( name: Nombre.getText(),);
        //image: );
    db
        .collection("personalRooms")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(yimages.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
    Navigator.of(context).popAndPushNamed("/Home");
  }

  void listItemShortClicked(int index){

  }

  void selectImage() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    //final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        blImageLoaded=true;
        dListHeightPorcentage=0.5;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir fotos',),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.only(top:80,bottom:150,),
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

        child:
            Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(padding: EdgeInsets.all(40)),
                Nombre,
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple),
                  ),
                  onPressed: () {
                   selectImage();
                  },
                  icon:  Icon(Icons.add_a_photo),
                  label: Text("Añadr foto"),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed:(){
                        btn1Pressed(context);
                      },
                      child: Text("Aceptar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.blue),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Respond to button press
                        Navigator.of(context).popAndPushNamed("/home");
                      },
                      child: Text("Cancelar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.blue),
                    ),
                  ],
                )
              ],
            ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
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
          ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}






//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// //
// //
// // class FormView extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //
// //     return _FormViewState();
// //   }
// //
// //   InputText Nombre = InputText( titulo: "Nombre",ayuda: "De la persona de la foto.",);
// //   final ImagePicker _picker = ImagePicker();
// //   late File imageFile;
// //   bool blImageLoaded=false;
// //   double dListHeightPorcentage=0.8;
// //   final storage = FirebaseStorage.instance;
// //   TextEditingController emailController = new TextEditingController();
// //   FirebaseFirestore db=FirebaseFirestore.instance;
// //
// //   class _FormViewState extends State<FormView>{
// //   void btn1Pressed(BuildContext context) async {
// //     YourImages yimages= new YourImages(
// //         name: Nombre.getText(),);
// //         //image: );
// //     db
// //         .collection("personalRooms")
// //         .doc(FirebaseAuth.instance.currentUser?.uid)
// //         .set(yimages.toFirestore())
// //         .onError((e, _) => print("Error writing document: $e"));
// //     Navigator.of(context).popAndPushNamed("/Home");
// //   }
// //
// //   void sendPressed(String sNuevoTexto)async {
// //
// //     //INICIO DE SUBIDO DE LA IMAGEN
// //     String sUrl="";
// //     if(blImageLoaded){
// //       final storageRef = FirebaseStorage.instance.ref();//Apunta a la / del storage
// //       //final imagen1ImagesRef = storageRef.child("imagenes/avatar2.jpg");
// //       final imagen1ImagesRef = storageRef.child("imagenes/rooms/${DataHolder().selectedChatRoom.uid}/img_${Timestamp.now().seconds}.jpg");
// //
// //       try {
// //         await imagen1ImagesRef.putFile(imageFile);
// //         sUrl=await imagen1ImagesRef.getDownloadURL();
// //
// //         setState(() {
// //           blImageLoaded=false;
// //           dListHeightPorcentage=0.8;
// //         });
// //
// //       } on FirebaseException catch (e) {
// //         print("DEBUG: HUBO UN ERROR EN EL ENVIO DE LA IMAGEN: $e");
// //         // ...
// //       }
// //     }
// //
// //   void selectImage() async{
// //     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         imageFile = File(pickedFile.path);
// //         blImageLoaded=true;
// //         dListHeightPorcentage=0.5;
// //       });
// //     }
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('New Photos'),
// //         backgroundColor: Colors.deepPurple,
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             colorFilter: ColorFilter.mode(HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
// //             image: AssetImage("assets/images/arboles.jpg"),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         child:
// //             Container(
// //             child: Column(
// //               // mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Padding(padding: EdgeInsets.all(40)),
// //                 Nombre,
// //                 const SizedBox(
// //                   height: 40,
// //                 ),
// //                 ElevatedButton.icon(
// //                   onPressed: () {
// //                    // selectImage()
// //                   },
// //                   icon:  Icon(Icons.add_a_photo),
// //                   label: Text("Add photo"),
// //                 ),
// //                 const SizedBox(
// //                   height: 70,
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     OutlinedButton(
// //                       onPressed:(){
// //                         btn1Pressed(context);
// //                       },
// //                       child: Text("Aceptar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.purple),
// //                     ),
// //                     OutlinedButton(
// //                       onPressed: () {
// //                         // Respond to button press
// //                         Navigator.of(context).popAndPushNamed("/home");
// //                       },
// //                       child: Text("Cancelar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.purple),
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //               decoration: BoxDecoration(
// //                   gradient: LinearGradient(
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                     stops: const [0.1, 0.4, 0.7, 0.9],
// //                     colors: [
// //                       HexColor("#4b4293").withOpacity(0.8),
// //                       HexColor("#4b4293"),
// //                       HexColor("#08418e"),
// //                       HexColor("#08418e")
// //                     ],
// //                   ),
// //                   borderRadius:BorderRadius.circular(10),
// //                   //border: Border.all(color: Colors.pink,width: 2),
// //                   boxShadow:[BoxShadow(color: Colors.purple,offset: Offset(5.0,5.0),blurRadius: 12.0)]
// //
// //               ),
// //               padding: EdgeInsets.all(10),
// //               margin:  EdgeInsets.only(left: 40,right: 40,bottom: 20,top: 20),
// //           ),
// //       ),
// //       backgroundColor: Colors.cyan,
// //     );
// //   }
// // }
// //}