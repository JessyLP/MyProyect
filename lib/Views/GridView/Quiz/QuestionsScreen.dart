import 'package:flutter/material.dart';

import '../../../BarMenu.dart';
import '../../../Customs/HexColor.dart';
import 'Question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  final List<Question> questions = QuestionData().questions;

  int index = 0;
  int score = 0;
  bool falseUserAnswer = false;
  bool trueUserAnswer = true;

  Future<void> showAnswer(bool correctAnswer) async {
    String titleDialog = (correctAnswer) ? 'Era cierto ' : 'Era falso. ';
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(titleDialog),
          children: [
            Center(child: Text(questions[index].explication,)),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                nextQuestion();
              },
              child: const Text('Siguiente pregunta.'),
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    if(index < questions.length - 1) {
      index++;
      setState(() {});
    } else {
      showresult();

    }
  }

  Future<void> showresult() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('¡Terminamos!'),
            content: Text('Tu puntuación es: $score puntos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new BarMenu(),
                    ),
                  );
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    final Question question = questions[index];
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntuacion: $score'),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),
      body:Container(
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
      child:Container(
        height: MediaQuery.of(context).size.height * 1,
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pregunta número: ${index + 1} / ${questions.length}', style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            Text(question.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
            SizedBox(
              height: 350,
              width: 350,
              child: Image.network(
                question.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 60,
                  width: 180,
                  child: TextButton(
                    onPressed: () {
                      showAnswer(question.answer);
                      setState(() {
                        if (falseUserAnswer == questions[index].answer) {
                          score +=1;
                        } else {
                          score += 0;
                        }
                      });
                    },
                    child: const Text('Falso'),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 180,
                  child: TextButton(
                    onPressed: () {
                      showAnswer(question.answer);
                      if (trueUserAnswer == questions[index].answer) {
                        score +=1;
                      } else {
                        score += 0;
                      }
                    },
                    child: const Text('Verdadero'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}