import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/data/preguntas_cuestionario.dart';
import 'package:preguntas_incomodas/layout/main_layout2.dart';
import 'package:preguntas_incomodas/models/pregunta_cuestionario.dart';
import 'package:preguntas_incomodas/pages/CuestionarioPage.dart';
import 'package:provider/provider.dart';

import '../providers/info_provider.dart';
import '../utils/my_colors.dart';


class CuestionariosListPage extends StatelessWidget {
  const CuestionariosListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> cuestionarios = [
      "CUESTIONARIO 1",
      "CUESTIONARIO 2",
      "CUESTIONARIO 3",
      "CUESTIONARIO 4",
      "CUESTIONARIO 5",
      "CUESTIONARIO 6",
      "CUESTIONARIO 7",
      "CUESTIONARIO 8",
      "CUESTIONARIO 9",
      "CUESTIONARIO 10",
    ];


    final infoProvider = Provider.of<InfoProvider>(context, listen: true);
    final intentosCuestionarios = infoProvider.intentosCuestionarios1;
    
    return MainLayout2(
      child: Center(
        child: Column(
          children:  [
            const SizedBox(height: 20),
            Text("Seleccionar Cuestionario", style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cuestionarios.length,
                itemBuilder: (BuildContext context, int index){
                  
                  final cuestionarioName = cuestionarios[index];
                  final intento = intentosCuestionarios[index];

                  List<PreguntaCuestionario> preguntasPlayer1;
                  List<PreguntaCuestionario> preguntasPlayer2;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 7,
                      color: MyColors.primary,
                      child: InkWell(
                        onTap: (){
                          switch (cuestionarioName) {
                            case "CUESTIONARIO 1":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2; 
                              infoProvider.updateQuestionary = 0;
                              break;
                            case "CUESTIONARIO 2":
                              preguntasPlayer1 = cuestionario_2_player1; 
                              preguntasPlayer2 = cuestionario_2_player2;
                              infoProvider.updateQuestionary = 1; 
                              break;
                            case "CUESTIONARIO 3":
                              preguntasPlayer1 = cuestionario_3_player1; 
                              preguntasPlayer2 = cuestionario_3_player2;
                              infoProvider.updateQuestionary = 2;
                              break;
                            case "CUESTIONARIO 4":
                              preguntasPlayer1 = cuestionario_4_player1; 
                              preguntasPlayer2 = cuestionario_4_player2;
                              infoProvider.updateQuestionary = 3; 
                              break;
                            case "CUESTIONARIO 5":
                              preguntasPlayer1 = cuestionario_5_player1; 
                              preguntasPlayer2 = cuestionario_5_player2;
                              infoProvider.updateQuestionary = 4; 
                              break;
                            case "CUESTIONARIO 6":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2;
                              infoProvider.updateQuestionary = 5; 
                              break;
                            case "CUESTIONARIO 7":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2;
                              infoProvider.updateQuestionary = 6;
                              break;
                            case "CUESTIONARIO 8":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2;
                              infoProvider.updateQuestionary = 7; 
                              break;
                            case "CUESTIONARIO 9":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2;
                              infoProvider.updateQuestionary = 8;
                              break;
                            case "CUESTIONARIO 10":
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2; 
                              infoProvider.updateQuestionary = 9;
                              break;
                            default:
                              preguntasPlayer1 = cuestionario_1_player1; 
                              preguntasPlayer2 = cuestionario_1_player2; 
                              infoProvider.updateQuestionary = 0;
                          }

                          // Inicializamos las respuestas de los jugadores en nulas
                          infoProvider.jugador1Responses = [];
                          infoProvider.jugador2Responses = [];
                    
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => 
                              CuestionarioPage(
                                cuestionario: cuestionarioName,
                                preguntasPlayer1: preguntasPlayer1,
                                preguntasPlayer2: preguntasPlayer2,
                              )
                            ),
                          );
                        },
                        child: _ButtonCuestionarioList(cuestionarioName: cuestionarioName, intento: intento),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}

class _ButtonCuestionarioList extends StatelessWidget {
  const _ButtonCuestionarioList({
    Key? key,
    required this.cuestionarioName,
    required this.intento,
  }) : super(key: key);

  final String cuestionarioName;
  final String intento;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cuestionarioName, style: Theme.of(context).textTheme.headline5), 
            const SizedBox(height: 5),
            Text("Veces Completado: $intento", style: const TextStyle(color: Colors.white)),              
          ],
        ),
      ),
    );
  }
}