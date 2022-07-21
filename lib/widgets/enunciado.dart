import 'package:flutter/material.dart';

class EnunciadoPregunta extends StatelessWidget {
  const EnunciadoPregunta({
    Key? key,
    required this.enunciado,
  }) : super(key: key);

  final String enunciado;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(enunciado, style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center,),
            ),
          )
        ],
      )
    );
  }
}
