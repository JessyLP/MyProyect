import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Customs/InputText.dart';


class LoginView extends StatelessWidget{

  LoginView({Key? key}) : super(key:key);

  InputText inputUser = InputText(
    titulo: "Correo:",
    ayuda:"ejemplo@gmail.com",);
  InputText inputPassword = InputText(
    titulo: "Password:",
    ayuda:"Mayor de 7 caracteres",
    blIsPsswd: true,);


  void btn1Pressed(BuildContext context) async{
    print(inputUser.getText());
     print(inputPassword.getText());
  }



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondoCielo.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: Scaffold(

            appBar: AppBar(
              title: const Text('🔸  LOGIN  🔸 '),
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold ),
              backgroundColor: Colors.deepPurple,
            ),
            body:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: inputUser
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: inputPassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      ElevatedButton(
                        onPressed: () => (btn1Pressed(context))
                        ,child: Text(' LOGIN'),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo
                        ),

                      ),
                      ElevatedButton.icon(
                        onPressed: (){
                          Navigator.of(context).popAndPushNamed("/registerview");
                        },
                        icon: Icon(Icons.accessibility, size: 18),
                        label: Text(' REGISTRAR'),
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