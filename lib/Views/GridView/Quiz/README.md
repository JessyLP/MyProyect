#Quiz

Un juego de verdadero o falso.

## QuestionsScreen

En esta clase se encuentra la configuracion del questionario.

Donde se especifica la respuesta que se obtendrá al acertar o fallar:

´´´
String titleDialog = (correctAnswer) ? '¡Acertaste! :)' : '¡Fallaste! :(';
´´´ 

Para avanzar en las preguntas se usa el siguiente código:
´´´
void nextQuestion() {
if(index < questions.length - 1) {
index++;
setState(() {});
} else {
showresult();

    }
}
´´´

## Question.

Esta clase solamente recoge todas las preguntas que se van a utilizar en el questionario.


##Quiz.

La pantalla inicial del quiestionario que incluye un texto y una imagen, para empezar a jugar hay que hacer click en el texto de abajo.
