
import 'package:flutter/material.dart';


import 'quiz.dart';

void main() => runApp(QuizApp());
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: MaterialApp(


        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text("Questions/Réponses"),
            backgroundColor: Colors.grey,

          ),

          body: SafeArea(


            child: Container(



              decoration: BoxDecoration(

                image: DecorationImage(
                  image: NetworkImage('https://quipoquiz.com/sn_uploads/quizzes/france_FR.jpg')
                  ,
                 // centerSlice: new Rect.fromLTWH(30.0, 30.0, 0.0, 0.0),
                  fit:BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),





                ),

              ),
              child: QuizPage(),


            ),

          ),
        ),
      ),


    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

// a variable to store our scores
  List<Icon> scores = [];

  Quiz quizClass = Quiz();

  bool completed = false;

// this function checks the user answer if correct
  void checkAnswer(bool userAnswer) {
    bool correctAns = quizClass.getQuestionAnswer();
    setState(() {
      if (quizClass.nextQuestion() == true) {
        print('next question');
        print(quizClass.nextQuestion());
        completed = true;
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } if (userAnswer != correctAns) {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
         else {
           print(quizClass.nextQuestion());

      }
      } else {
        print('setting marks');
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } if (userAnswer != correctAns) {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        else {
          print(quizClass.nextQuestion());

        }
      }
    });
  }

 @override
  Widget build(BuildContext context) {
    return buildQuestionsPage();
  }


  Column buildQuestionsPage() {
    if (completed) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Container(

            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[

                    Text(
                      'Quiz Terminé !',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(

                  textColor: Colors.white,
                  color: Colors.blue.shade500,
                  onPressed: () {
                    setState(() {
                      completed = false;
                      scores = [];
                      quizClass.startOver();
                    });
                  },
                  child: Text(
                    'Recommencer',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
              alignment: Alignment.center,
              width: 300,
              height: 200,

              decoration: new BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )
              ),
              child:  Text(
              quizClass.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
          ),


            Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.green.shade500,
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'Vrai',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.red.shade500,
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'Faux',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey,
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'Passe',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),

          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    }
  }
}