import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/layout/main_layout2.dart';
import 'package:preguntas_incomodas/pages/CuestionariosListPage.dart';
import 'package:preguntas_incomodas/utils/my_colors.dart';

class ModoPage extends StatelessWidget {
  const ModoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MainLayout2(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text("Seleccionar Modo de Juego", style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
              const SizedBox(height: 80),
      
              _Tarjeta(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Normal", style: Theme.of(context).textTheme.headline5),
                    const Text("- 10 cuestionarios", style: TextStyle(color: Colors.white)),
                    const Text("- Adecuado para todas las edades", style: TextStyle(color: Colors.white)),
                  ],
                )
              ),
      
              const SizedBox(height: 40),
      
              _Tarjeta(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Adulto", style: Theme.of(context).textTheme.headline5),
                    const Text("- 8 cuestionarios", style: TextStyle(color: Colors.white)),
                    const Text("- Elimina todos los anuncios", style: TextStyle(color: Colors.white)),
                    const Text("- Adecuado solo para adultos", style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 2,),
                  ],
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {

  const _Tarjeta({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 9,
      color: MyColors.primary,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CuestionariosListPage()),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: content
          ),
        ),
      ),
    );
  }
}