import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:preguntas_incomodas/widgets/card_component.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';

class Instrucciones extends StatelessWidget {

  final VoidCallback onStart;
  final bool direction;

  const Instrucciones({
    Key? key,
    required this.onStart,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);

    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                   
                Text(
                  direction ? "Turno de: ${infoProvider.jugador1}" : "Turno de: ${infoProvider.jugador2}", 
                  style: Theme.of(context).textTheme.headline3, 
                  textAlign: TextAlign.center
                ),
            
              
                const SizedBox(height: 50),  

                !direction ? const _ChooseShowAnswers() : const SizedBox.shrink(),
                const SizedBox(height: 10),  

                Container(
                  constraints: const BoxConstraints(maxWidth: 400, maxHeight: 160),
                  //height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: direction ?

                    // Muestra las instrucciones para el Jugador 1
                    _InstructionsPlayer1(infoProvider: infoProvider) :

                    // Muestra las Instrucciones para el Jugador 2
                    _InstructionsPlayer2(infoProvider: infoProvider)
                ),      
              ],
            ),
          ),

          CustomButton(
            texto: "CONTINUAR", 
            onPressed: onStart
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ChooseShowAnswers extends StatefulWidget {
  const _ChooseShowAnswers({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChooseShowAnswers> createState() => _ChooseShowAnswersState();
}

class _ChooseShowAnswersState extends State<_ChooseShowAnswers> {

  bool showCorrectAnswers = false;

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    
    return Center(
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        alignment: AlignmentDirectional.center,
        children:  [
          BounceInLeft(
            duration: const Duration(milliseconds: 2000),
            child: Padding(
              padding: const EdgeInsets.only(right: 160),
              child: CardComponent(
                text: "Mostrar cada respuesta correcta",
                right: false,
                selected: showCorrectAnswers,
                onClick: (){
                  infoProvider.showCorrectAnswers = true;
                  setState(() {
                    showCorrectAnswers = true;
                  });
                },
              ),
            ),
          ),
          BounceInRight(
            duration: const Duration(milliseconds: 2000),
            child: Padding(
              padding: const EdgeInsets.only(left: 160),
              child: CardComponent(
                text: "No mostrar las respuestas correctas",
                right: true,
                selected: !showCorrectAnswers,
                onClick: (){
                  infoProvider.showCorrectAnswers = false;
                  setState(() {
                    showCorrectAnswers = false;
                  });
                },
              ),
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle
            ),
            child: const Center(child: Text("o", style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}

class _InstructionsPlayer2 extends StatelessWidget {
  const _InstructionsPlayer2({
    Key? key,
    required this.infoProvider,
  }) : super(key: key);

  final InfoProvider infoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${infoProvider.jugador2}, responde a las mismas preguntas y trata de adivinar las respuestas de ${infoProvider.jugador1}", 
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}

class _InstructionsPlayer1 extends StatelessWidget {
  const _InstructionsPlayer1({
    Key? key,
    required this.infoProvider,
  }) : super(key: key);

  final InfoProvider infoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${infoProvider.jugador1} contesta a las siguientes 10 preguntas", 
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20),
        Text(
          "Después ${infoProvider.jugador2} intentará adivinar tus respuestas.", 
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6
        )
      ],
    );
  }
}