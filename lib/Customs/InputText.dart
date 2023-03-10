import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final String titulo;
  final String ayuda;
  final bool blIsPsswd;

  InputText({Key? key,  this.titulo="",  this.ayuda="",  this.blIsPsswd=false,}) : super(key:key);
  final TextEditingController myController = TextEditingController();


  String getText(){
    return myController.text;
  }

  void setInitialValue(String initialValue){
    myController.text=initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: blIsPsswd,
      controller: myController,
      cursorColor: Colors.deepPurple,
      //initialValue: 'Input text',
      maxLength: 20,
      enableSuggestions: !blIsPsswd,
      autocorrect: !blIsPsswd,

      decoration:  InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(Icons.person),
        labelText: titulo,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
        helperText: ayuda,
        suffixIcon: Icon(
          Icons.abc,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }

}