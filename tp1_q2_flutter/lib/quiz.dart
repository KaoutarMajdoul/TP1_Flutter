
import 'questions.dart';

class Quiz {

  int _questionNumber = 0;


  List<Question> _questionList = [
    Question(qtn: 'La france est aussi appelée l\'hexagone', ans: true),
    Question(qtn: 'Certains volcans d\'Auvergne, situé dans le massif central sont encore actif' , ans: true),
    Question(qtn: 'Le Rhone est le plus grand fleuve de France',ans: false),
    Question(qtn: 'Le mont Blanc est le plus haut sommet d\'europe', ans: false),
   ];


  dynamic nextQuestion(){
    if(_questionNumber < _questionList.length - 1){
      print(_questionNumber);
      _questionNumber++;
    }else{
      bool completed = true;
      return completed;
    }
  }

  String getQuestionText(){
    return _questionList[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionList[_questionNumber].questionAnswer;
  }

  int startOver(){
    return _questionNumber = 0;
  }
}