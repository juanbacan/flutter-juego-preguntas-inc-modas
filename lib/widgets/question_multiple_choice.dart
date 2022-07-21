import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/info_provider.dart';
import 'button_multiple_option.dart';


class QuestionMultipleChoice extends StatefulWidget {
  
  final List<String> respuestas;
  final VoidCallback mainFunction;
  final bool showCorrectAnswer;
  final int numPregunta;

  const QuestionMultipleChoice({
    Key? key,
    required this.respuestas,
    required this.mainFunction,
    this.showCorrectAnswer = false,
    this.numPregunta = 0,
  }) : super(key: key);

  @override
  State<QuestionMultipleChoice> createState() => _QuestionMultipleChoiceState();
}

class _QuestionMultipleChoiceState extends State<QuestionMultipleChoice> {
  
  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);

    return Expanded(
      flex: 3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        itemCount: widget.respuestas.length,
        itemBuilder: (BuildContext context, int index){
          final respuesta = widget.respuestas[index];
          return !widget.showCorrectAnswer ?
            ButtonMultipleOption(
              texto: respuesta, 
              onPressed: () {
                // Guarda la respuesta del Jugador 2
                infoProvider.jugador1Responses.add(index);
                // Actualiza la pregunta
                widget.mainFunction();
              },
            ) : 
              !infoProvider.showCorrectAnswers ? 
                // Mo muestra las respuestas correctas
                _OptionWithCorrectAnswer1(
                  texto: respuesta,
                  index: index,
                  numPregunta: widget.numPregunta,
                  mainFunction: widget.mainFunction,
                )

                // Muestra las respuestas correctas
              : _OptionWithCorrectAnswer2(
                  texto: respuesta,
                  index: index,
                  numPregunta: widget.numPregunta,
                  mainFunction: widget.mainFunction,
                );
        }
      ),
    );
  }
}

// No muestra las respuestas correctas
class _OptionWithCorrectAnswer1 extends StatelessWidget {

  final String texto;
  final int index;
  final int numPregunta;
  final VoidCallback mainFunction;

  const _OptionWithCorrectAnswer1({
    required this.texto,      // Texeto de la respuesta
    required this.index,      // Respuesta seleccionada usuario 2
    required this.numPregunta, // Número de Pregunta actual
    required this.mainFunction,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    final respuestasPlayer1 = infoProvider.jugador1Responses;
    return ButtonMultipleOption(
      texto: texto, 
      onPressed: () async {

        if(infoProvider.showingResult) return;  // El resultado está siendo mostrado

        infoProvider.showingResult = true;      // Inhabilita los botones mientras se muestra la respuesta

        infoProvider.jugador2Responses.add(index);

        if(respuestasPlayer1[numPregunta] == index){
          infoProvider.correctAnswer = true;
        }
        else{
          infoProvider.correctAnswer = false;
        }
        await Future.delayed(const Duration(seconds: 2)); // Tiempo de Espera

        infoProvider.showingResult = false;   // Habilita los botones nuevamente
        mainFunction(); // Función que cambia la Pregunta
      }
    );
  }
}

// Muestra las respuestas correctas
class _OptionWithCorrectAnswer2 extends StatefulWidget {

  final String texto;
  final int index;
  final int numPregunta;
  final VoidCallback mainFunction;

  const _OptionWithCorrectAnswer2({
    Key? key,
    required this.texto,      // Texeto de la respuesta
    required this.index,      // Respuesta seleccionada usuario 2
    required this.numPregunta, // Número de Pregunta actual
    required this.mainFunction
  }) : super(key: key);

  @override
  State<_OptionWithCorrectAnswer2> createState() => __OptionWithCorrectAnswerState2();
}

class __OptionWithCorrectAnswerState2 extends State<_OptionWithCorrectAnswer2> {

  bool contestada = false;
  bool correcta = false;

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: true);
    final respuestasPlayer1 = infoProvider.jugador1Responses;
    final opcionCorrecta = respuestasPlayer1[widget.numPregunta] == widget.index;

    return ButtonMultipleOption(
      texto: widget.texto, 
      answered: (infoProvider.correctAnswerShow && opcionCorrecta) ? true : contestada,
      correctAnswer: (infoProvider.correctAnswerShow && opcionCorrecta) ? true : correcta,
      onPressed: () async {
        if(infoProvider.showingResult) return;  // El resultado está siendo mostrado

        infoProvider.showingResult = true;      // Inhabilita los botones mientras se muestra la respuesta

        infoProvider.jugador1Responses.add(widget.index);
        if(opcionCorrecta){
          setState(() {
            contestada = true;
            correcta = true;
          });
          //infoProvider.correctAnswer = true;
        }
        else{
          setState(() {
            contestada = true;
            correcta = false;
          });
          infoProvider.correctAnswerShow = true;    // Se debe mostrar la respuesta correcta
        }
        await Future.delayed(const Duration(seconds: 3)); // Tiempo de Espera

        infoProvider.showingResult = false;   // Habilita los botones nuevamente
        infoProvider.correctAnswerShow = false;    // Resetea que se muestre la respuesta correcta
        widget.mainFunction(); // Función que cambia la Pregunta

        if(mounted){
          setState(() {
            contestada = false;
            correcta = false;
          });
        }
      }
    );
  }
}