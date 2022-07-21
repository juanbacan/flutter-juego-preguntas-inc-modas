import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:preguntas_incomodas/layout/main_layout.dart';
import 'package:preguntas_incomodas/models/pregunta_cuestionario.dart';
import 'package:preguntas_incomodas/pages/ResultadoPage.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:preguntas_incomodas/widgets/enunciado.dart';
import 'package:preguntas_incomodas/widgets/instrucciones.dart';
import 'package:preguntas_incomodas/widgets/question_multiple_choice.dart';
import 'package:provider/provider.dart';

import '../widgets/question_yes_no.dart';

class Cuestionario2Page extends StatefulWidget {

  final String cuestionario;
  final List<PreguntaCuestionario> preguntasPlayer2;

  const Cuestionario2Page({
    Key? key, 
    required this.cuestionario,
    required this.preguntasPlayer2
  }) : super(key: key);

  @override
  State<Cuestionario2Page> createState() => _Cuestionario2PageState();
}

class _Cuestionario2PageState extends State<Cuestionario2Page> {

  bool start = false;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAds: false,
      child: start 
        ? _CuestionarioPreguntas(preguntasPlayer2: widget.preguntasPlayer2,)

        : Instrucciones(
            direction: false,
            onStart: (){
              setState(() {
                start = true;
              });
            },
          ),
    );
  }
}

class _CuestionarioPreguntas extends StatefulWidget {

  final List<PreguntaCuestionario> preguntasPlayer2;

  const _CuestionarioPreguntas({
    required this.preguntasPlayer2,
    Key? key,
  }) : super(key: key);

  @override
  State<_CuestionarioPreguntas> createState() => _CuestionarioPreguntasState();
}

class _CuestionarioPreguntasState extends State<_CuestionarioPreguntas> {

  int _numPregunta = 0;


  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: true);

    final List<PreguntaCuestionario> preguntas = widget.preguntasPlayer2;
    final PreguntaCuestionario pregunta = preguntas[_numPregunta];
    final int maxPreguntas = preguntas.length - 1;

    void nextQuestion(){
      if(_numPregunta >= maxPreguntas){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResultadoPage())
        );
        return;
      }

      // Si el componente aún estámontado
      if(mounted){
        setState(() {
          _numPregunta ++;
        });
      }
    }

    return Center(
      child: Column(
        children: [    

          EnunciadoPregunta(enunciado: pregunta.enunciado.replaceAll("player1", infoProvider.jugador1)),

          const SizedBox(height: 50),

          
          // No muestra las respuestas correctas
          !infoProvider.showCorrectAnswers ?
            !infoProvider.showingResult 
              ? (pregunta.respuestas.length < 3) ?
                QuestionYesNo(
                  showCorrectAnswer: true,
                  numPregunta: _numPregunta,
                  onPressedYes: () {
                    infoProvider.jugador2Responses.add(1);
                      nextQuestion();
                  },
                  onPressedNo: () {
                    infoProvider.jugador2Responses.add(0);
                      nextQuestion();
                  },
                )
                  
                : QuestionMultipleChoice(
                    respuestas: pregunta.respuestas,
                    showCorrectAnswer: true,
                    numPregunta: _numPregunta,
                    mainFunction: () => nextQuestion(),
                  )

              : Expanded(
                flex: (pregunta.respuestas.length < 3) ? 1 : 3,
                child: infoProvider.correctAnswer 
                ? LottieBuilder.asset('assets/images/correct.json', repeat: false, width: 250,)
                : LottieBuilder.asset('assets/images/incorrect.json', repeat: false, width: 200,),
              )

          // Si muestra las respuestas correctas

          : (pregunta.respuestas.length < 3) ?
            !infoProvider.showingResult 
              ? QuestionYesNo(
                showCorrectAnswer: true,
                numPregunta: _numPregunta,
                onPressedYes: () {
                  infoProvider.jugador2Responses.add(1);
                    nextQuestion();
                },
                onPressedNo: () {
                  infoProvider.jugador2Responses.add(0);
                    nextQuestion();
                },
              )

              : infoProvider.correctAnswer 
                ? LottieBuilder.asset('assets/images/correct.json', repeat: false, width: 250,)
                : LottieBuilder.asset('assets/images/incorrect.json', repeat: false, width: 200)
              
            : QuestionMultipleChoice(
                respuestas: pregunta.respuestas,
                showCorrectAnswer: true,
                numPregunta: _numPregunta,
                mainFunction: () => nextQuestion(),
              ),
              
          const SizedBox(height: 50),  
        ],
      ),
    );
  }
}

