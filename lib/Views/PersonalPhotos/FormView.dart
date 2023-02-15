import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Customs/HexColor.dart';


import '../../Customs/InputText.dart';
import '../../Firebase/YourImages.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  InputText Nombre = InputText( titulo: "Nombre",ayuda: "De la persona de la foto.",);

  final ImagePicker _picker = ImagePicker();
  late File imageFile;
  bool blImageLoaded=false;
  double dListHeightPorcentage=0.8;

  TextEditingController emailController = new TextEditingController();

  FirebaseFirestore db=FirebaseFirestore.instance;


  void btn1Pressed(BuildContext context) async {
    YourImages yimages= new YourImages(
        name: Nombre.getText(),);
        //image: );
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("assets/images/arboles.jpg"),
            fit: BoxFit.cover,
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
                  onPressed: () {
                   // selectImage()
                  },
                  icon:  Icon(Icons.add_a_photo),
                  label: Text("Add photo"),
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
                      child: Text("Aceptar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.purple),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Respond to button press
                        Navigator.of(context).popAndPushNamed("/home");
                      },
                      child: Text("Cancelar"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.purple),
                    ),
                  ],
                )
              ],
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
          ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}