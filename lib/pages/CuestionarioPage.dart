import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/layout/main_layout.dart';
import 'package:preguntas_incomodas/models/pregunta_cuestionario.dart';
import 'package:provider/provider.dart';
import 'package:preguntas_incomodas/pages/Cuestionario2Page.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:preguntas_incomodas/widgets/enunciado.dart';
import 'package:preguntas_incomodas/widgets/instrucciones.dart';
import '../widgets/question_multiple_choice.dart';
import '../widgets/question_yes_no.dart';

class CuestionarioPage extends StatefulWidget {

  final String cuestionario;
  final List<PreguntaCuestionario> preguntasPlayer1;
  final List<PreguntaCuestionario> preguntasPlayer2;

  const CuestionarioPage({
    Key? key, 
    required this.cuestionario,
    required this.preguntasPlayer1,
    required this.preguntasPlayer2,
  }) : super(key: key);

  @override
  State<CuestionarioPage> createState() => _CuestionarioPageState();
}

class _CuestionarioPageState extends State<CuestionarioPage> {

  bool start = false;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAds: false,
      child: start 

        // Cuestionario
        ? _CuestionarioPreguntas(
          cuestionario: widget.cuestionario, 
          preguntasPlayer1: widget.preguntasPlayer1,
          preguntasPlayer2: widget.preguntasPlayer2,
        )

        // Instrucciones
        : Instrucciones(
          direction: true,
          onStart: (){
            setState(() {
              start = true;
            });
          },
        )
    );
  }
}


class _CuestionarioPreguntas extends StatefulWidget {

  final String cuestionario;
  final List<PreguntaCuestionario> preguntasPlayer1;
  final List<PreguntaCuestionario> preguntasPlayer2;

  const _CuestionarioPreguntas({
    required this.cuestionario,
    required this.preguntasPlayer1,
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

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);

    final List<PreguntaCuestionario> preguntas = widget.preguntasPlayer1;
    final PreguntaCuestionario pregunta = preguntas[_numPregunta];
    final int maxPreguntas = preguntas.length - 1;

    void nextQuestion(){
      
      if(_numPregunta >= maxPreguntas){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => 
            Cuestionario2Page(
              cuestionario: widget.cuestionario, 
              preguntasPlayer2: widget.preguntasPlayer2
            )
          ),
        );
        return;
      }
      setState(() {
        _numPregunta ++;
      });
    }

    return Center(
      child: Column(
        children: [    
          EnunciadoPregunta(enunciado: pregunta.enunciado),

          const SizedBox(height: 50),

          (pregunta.respuestas.length < 3) ?
            QuestionYesNo(
              respuestas: pregunta.respuestas,
              onPressedYes: () {
                infoProvider.jugador1Responses.add(1);
                nextQuestion();
              },
              onPressedNo: () {
                infoProvider.jugador1Responses.add(0);
                nextQuestion();
              },
            )
               
            : QuestionMultipleChoice(
                respuestas: pregunta.respuestas,
                mainFunction: () => nextQuestion()
              ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}




