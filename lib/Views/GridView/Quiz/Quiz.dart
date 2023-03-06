import 'package:flutter/material.dart';
import 'QuestionsScreen.dart';


class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Un pequeño test'),),
      body: Center(
        child: Container(
          height: 390,
          width: 390,
          decoration: const BoxDecoration(
              color: Colors.orange,
              boxShadow: [
                BoxShadow(color: Colors.grey, offset: Offset(4, 4), blurRadius: 5),
              ]
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/quiz1.png', fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/quiz2");
                  },
                  child: const Text('Haga clic aquí para empezar.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}