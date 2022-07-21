import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/utils/my_colors.dart';

class CustomInput extends StatelessWidget {

  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool? showError;

  const CustomInput({ 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.showError = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.input,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        autofocus: false,
        maxLength: 14,
        style: TextStyle(color: MyColors.secondary, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          counterText: '',
          hintText: placeholder,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon:  Icon(Icons.person, color: MyColors.secondary),
          errorText: showError! ? "Debe ingresar el nombre del jugador" : null,
          suffixIcon: showError! ? Icon(Icons.warning_amber_rounded, color: Colors.red[400]) : null
        ),
      ),
    );
  }
}