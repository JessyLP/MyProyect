import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Customs/InputText.dart';


class RegisterView extends StatelessWidget{

  RegisterView({Key? key}) : super(key:key);


  InputText inputUser = InputText(
    titulo: "Escribe tu correo:",
    ayuda:"ejemplo@ejemplo.com",);
  InputText inputPassword = InputText(
    titulo: "Escribe tu contraseña:",
    ayuda:"Mayor de 7 caracteres.",
    blIsPsswd: true,);
  InputText inputPasswordValidada = InputText(
    titulo: "Escribe tu contraseña:",
    ayuda:"Repite la contraseña.",
    blIsPsswd: true,);



  void register( BuildContext context) async{
    if ((inputPasswordValidada.getText()==(inputPassword.getText()))){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: inputUser.getText(),
          password: inputPassword.getText(),
        );
        Navigator.of(context).popAndPushNamed("/login");
      } on FirebaseAuthException catch (e) {
        print("ERROR: can not create user./ERROR: No se pudo crear el usuario.");
        if (e.code == 'weak-password') {
          print('ERROR: the password is weak./ERROR: la contraseña es débil.');
        } else if (e.code == 'email-already-in-use') {
          print('ERROR: This email is already in use./ERROR: El email ya esta en uso.');
        }
      } catch (e) {
        print(e);}
    }else{
      print("Error, las contraseñas son diferentes");
    }
  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/android/images/fondoAzul.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('🧾 REGISTER  '),
              backgroundColor: Colors.deepPurple,
            ),
            body:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  inputUser,
                  inputPassword,
                  inputPasswordValidada,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                          onPressed: () async{
                            if ((inputPasswordValidada.getText()==(inputPassword.getText()))){
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: inputUser.getText(),
                                  password: inputPassword.getText(),
                                );
                                print("------El usuario se ha creado sin problemas------");
                                Navigator.of(context).popAndPushNamed("/loginview");
                              } on FirebaseAuthException catch (e) {
                                print("------ ERROR AL CREAR EL USUARIO------");
                                if (e.code == 'weak-password') {
                                  print('La contraseña introducida es muy débil.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('Ya existe cuenta con ese correo.');
                                }
                              } catch (e) {
                                print(e);}
                            }else{
                              print("Error, las contraseñas son diferentes");
                            }
                          }

                          ,child: Text(' ACEPTAR')
                      ),


                      ElevatedButton(
                        onPressed: ( ){
                          Navigator.of(context).popAndPushNamed("/loginview");
                        },
                        child: Text(' CANCELAR'),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),

                      ),

                    ],
                  ),
                ],
              ),

            ),
            backgroundColor: Colors.transparent,

          ),
        )

    );

  }

}

