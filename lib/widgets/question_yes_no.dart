import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/info_provider.dart';
import 'button_yes_no.dart';

class QuestionYesNo extends StatelessWidget {

  final List<String>? respuestas;
  final VoidCallback onPressedYes;
  final VoidCallback onPressedNo;
  final bool showCorrectAnswer;
  final int numPregunta;

  const QuestionYesNo({
    Key? key,
    this.respuestas,
    required this.onPressedYes,
    required this.onPressedNo,
    this.showCorrectAnswer = false,
    this.numPregunta = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    final respuestasPlayer1 = infoProvider.jugador1Responses;

    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonYesNo(
            texto: respuestas != null ? respuestas![0] : "SÍ", color: Colors.white, 
            onPressed: () async{
              if(showCorrectAnswer){
                if(infoProvider.showingResult) return;  // El resultado está siendo mostrado
                
                infoProvider.showingResult = true;      // Inhabilita los botones mientras se muestra la respuesta
                
                if(respuestasPlayer1[numPregunta] == 1){
                  infoProvider.correctAnswer = true;
                }
                else{
                  infoProvider.correctAnswer = false;
                }
                await Future.delayed(const Duration(seconds: 2)); // Tiempo de Espera
                
                infoProvider.showingResult = false;   // Habilita los botones nuevamente
                onPressedYes();

              } else{
                onPressedYes();
              }
            }
          ),
          ButtonYesNo(
            texto: respuestas != null ? respuestas![1] : "No", 
            color: Colors.white, 
            onPressed: () async {
              if(showCorrectAnswer){
                if(infoProvider.showingResult) return;  // El resultado está siendo mostrado
                
                infoProvider.showingResult = true;      // Inhabilita los botones mientras se muestra la respuesta
                
                if(respuestasPlayer1[numPregunta] == 0){
                  infoProvider.correctAnswer = true;
                }
                else{
                  infoProvider.correctAnswer = false;
                }
                await Future.delayed(const Duration(seconds: 2)); // Tiempo de Espera
                
                infoProvider.showingResult = false;   // Habilita los botones nuevamente
                onPressedNo();
              } else{
                onPressedNo();
              }
            }
          ),
        ],
      ),
    );
  }
}