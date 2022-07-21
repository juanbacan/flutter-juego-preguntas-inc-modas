import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/layout/main_layout.dart';
import 'package:preguntas_incomodas/pages/ModoPage.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:preguntas_incomodas/shared_preferences/preferences.dart';
import 'package:preguntas_incomodas/widgets/custom_button.dart';
import 'package:preguntas_incomodas/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final jugador1Ctlr = TextEditingController(text: Preferences.jugador1);
  final jugador2Ctlr = TextEditingController(text: Preferences.jugador2);

  bool errorNamePlayer1 = false;
  bool errorNamePlayer2 = false;

  @override
  Widget build(BuildContext context) {

    final infoProvider = Provider.of<InfoProvider>(context, listen: false); 

    return MainLayout(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "¿En verdad me Conoces?", 
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center
                ),
              ),
              const SizedBox(height: 50),
              CustomInput(placeholder: "Nombre del Jugador UNO", textController: jugador1Ctlr, showError: errorNamePlayer1),
              const SizedBox(height: 20),
              CustomInput(placeholder: "Nombre del jugador DOS", textController: jugador2Ctlr, showError: errorNamePlayer2),
              const SizedBox(height: 50),
              
              CustomButton(
                texto: "INICIAR TEST",
                onPressed: (){
                  setState(() {
                    errorNamePlayer1 = false;
                    errorNamePlayer2 = false;
                  });
            
                  // Comprobamos que los nombres no esten en vacio 
                  if(jugador1Ctlr.text.trim() == ""){
                    setState(() => errorNamePlayer1 = true);
                    return;
                  }
                  if(jugador2Ctlr.text.trim() == ""){
                    setState(() => errorNamePlayer2 = true);
                    return;
                  }
                            
                  Preferences.jugador1 = jugador1Ctlr.text.trim();
                  Preferences.jugador2 = jugador2Ctlr.text.trim();
                      
                  infoProvider.jugador1 = jugador1Ctlr.text.trim();
                  infoProvider.jugador2 = jugador2Ctlr.text.trim();
                      
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ModoPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  // final _dataBase = DataBase.db;
  // final _preguntasBox = Hive.box<Pregunta>('preguntas');

  // @override
  // void dispose() {
  //   Hive.box<Pregunta>("preguntas").close();
  //   super.dispose();
  // }


  // void checkPreguntas(){

  //   if(!Preferences.ready){

  //     print("Grabando Preguntas");

  //     // Limpia
  //     _preguntasBox.clear();

  //     // Agrega las preguntas a la BD
  //     for (Pregunta pregunta in preguntasOr) {
  //       _dataBase.createItem(_preguntasBox, pregunta);
  //     }

  //     // Solo graba las preguntas la primera vez
  //     Preferences.ready = true;
  //   }
  //   _preguntas = _preguntasBox.values.toList();
  //   setState(() {});
  // }