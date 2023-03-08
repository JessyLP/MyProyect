import 'package:flutter/material.dart';
import 'QuestionsScreen.dart';


class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Un pequeño test'),),
      body: Center(
        /*child: Container(
          height: 290,
          width: 290,
          decoration: const BoxDecoration(
              color: Colors.purple,
              boxShadow: [
                BoxShadow(color: Colors.grey, offset: Offset(4, 4), blurRadius: 5),
              ]
          ),*/
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/quiz1.png', height: 20,width: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new QuestionsScreen(),
                      ),
                    );
                  },
                  child: const Text('Haga clic aquí para empezar.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
        ),
      //  ),
    );
  }
}