import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/utils/my_colors.dart';

class ButtonYesNo extends StatelessWidget {

  final String texto;
  final VoidCallback onPressed;
  final Color color;

  const ButtonYesNo({
    Key? key,
    required this.texto,
    required this.onPressed,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Center(
          child:Text(
            texto, 
            style: TextStyle(color: MyColors.secondary, fontSize: 20, fontWeight: FontWeight.w900), 
            textAlign: TextAlign.center
          )
        ),
      ),
      
    );
  }
}
