import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier{

  String jugador1;
  String jugador2;
  List<String> intentosCuestionarios1;

  InfoProvider({
    required String player1,
    required String player2,
    required List<String> intentosCuestionariosList,
  }): jugador1 = player1, jugador2 = player2, intentosCuestionarios1 = intentosCuestionariosList;


  List<int> _jugador1Responses = [];
  List<int> get jugador1Responses => _jugador1Responses;
  set jugador1Responses ( List<int> value ) {
    _jugador1Responses = value;
    notifyListeners();
  }
  
  List<int> _jugador2Responses = [];
  List<int> get jugador2Responses => _jugador2Responses;
  set jugador2Responses ( List<int> value ) {
    _jugador2Responses = value;
    notifyListeners();
  }


  // Si el resultado está siendo mostrado
  bool _showingResult = false;
  bool get showingResult => _showingResult;
  set showingResult ( bool value ) {
    _showingResult = value;
    notifyListeners();
  }
  // ******************************************************************

  // Si se debe mostrar el resultado con las respuestas correctas
  bool _showCorrectAnswers = false;
  bool get showCorrectAnswers => _showCorrectAnswers;
  set showCorrectAnswers ( bool value ) {
    _showCorrectAnswers = value;
    notifyListeners();
  }
  // ******************************************************************

  // Si se respondio correctamente y para mostrar los Lotties en el inicio
  bool _correctAnswer = false;
  bool get correctAnswer => _correctAnswer;
  set correctAnswer ( bool value ) {
    _correctAnswer = value;
    notifyListeners();
  }
  // ******************************************************************
  // Se muestra en verde la respuesta correcta ya que se ha seleccionado la respuesta incorrecta
  bool _correctAnswerShow = false;
  bool get correctAnswerShow => _correctAnswerShow;
  set correctAnswerShow ( bool value ) {
    _correctAnswerShow = value;
    notifyListeners();
  }
  // ******************************************************************

  // El número de cuestionario que se está resolviendo y que hay que grabar en las preferencias del Usuario
  int _updateQuestionary = 0;
  int get updateQuestionary => _updateQuestionary;
  set updateQuestionary ( int value ) {
    _updateQuestionary = value;
    notifyListeners();
  }



}