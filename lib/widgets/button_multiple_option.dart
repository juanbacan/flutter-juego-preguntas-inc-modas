
import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/utils/my_colors.dart';

class ButtonMultipleOption extends StatelessWidget {

  final String texto;
  final VoidCallback onPressed;
  final bool answered;
  final bool correctAnswer;

  const ButtonMultipleOption({
    Key? key,
    required this.texto,
    required this.onPressed,
    this.answered = false,
    this.correctAnswer = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: !answered ?  Colors.white : correctAnswer ? Colors.green : Colors.red,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height:55,
          child: Center(
            child:Text(
              texto, 
              style: TextStyle(
                color: !answered ?MyColors.secondary : Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.bold
              ), 
              textAlign: TextAlign.center
            )
          ),
        ),
        
      ),
    );
  }
}