import 'package:flutter/material.dart';

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
    String titleDialog = (correctAnswer) ? '¡Acertaste! :)' : '¡Fallaste! :(';
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
                  Navigator.of(context).popAndPushNamed("/bar");
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
      appBar: AppBar(title: Text('Puntuacion: $score'),),
      body: Container(
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
                          score++;
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
    );
  }
}