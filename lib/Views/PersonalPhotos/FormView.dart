import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Customs/InputText.dart';
import '../../Firebase/YourImages.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  InputText Nombre = InputText( titulo: "Nombre",ayuda: "De la coleccion nueva.",);
  InputText Imagen = InputText(titulo: "Imagen",ayuda: "Tipo: URL.",);

  final ImagePicker _picker = ImagePicker();
  late File imageFile;
  bool blImageLoaded=false;
  double dListHeightPorcentage=0.8;

  FirebaseFirestore db=FirebaseFirestore.instance;


  void btn1Pressed(BuildContext context) async {
    YourImages yimages= new YourImages(
        name: Nombre.getText(),
        image: Imagen.getText());
    db
        .collection("personalRooms")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(yimages.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
    Navigator.of(context).popAndPushNamed("/Home");
  }

  // void selectImage() async{
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       blImageLoaded=true;
  //       dListHeightPorcentage=0.5;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Photos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(40)),
            Nombre,
            Imagen,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed:(){
                    btn1Pressed(context);
                  },
                  child: Text("ACEPTAR"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,), backgroundColor: Colors.black),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.of(context).popAndPushNamed("/home");
                  },
                  child: Text("CANCELAR"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}