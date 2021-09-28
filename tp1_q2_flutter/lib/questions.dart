import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question {
  late String questionText ;
  late bool questionAnswer ;

  Question( {required String qtn, required bool ans}) {
    questionText = qtn;
    questionAnswer = ans;
  }
}