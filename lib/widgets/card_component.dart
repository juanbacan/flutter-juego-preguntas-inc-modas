import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {

  final bool right;
  final String text;
  final bool selected;
  final VoidCallback? onClick;

  const CardComponent({
    Key? key,
    required this.right,
    required this.text,
    this.selected = false,
    this.onClick,
  }) : super(key: key);

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: widget.right ? 0.1 : -0.1,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          InkWell(
            onTap: widget.onClick,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              //width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: widget.right ? gradiente1() : gradiente2()
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.text, 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, height: 1.5), 
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 15),
            child: widget.selected ? const Icon(Icons.check_circle, color: Colors.white, size: 28) : null,
          )
        ],
      ),
    );
  }

    LinearGradient gradiente2() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.0, 0.15, 0.5, 0.8],
      colors: [
      Color.fromARGB(255, 226, 17, 17),
      Color.fromARGB(255, 224, 40, 64),
      Color.fromARGB(255, 241, 24, 42),
      Color.fromARGB(255, 226, 17, 17)
      ],
    );
  }

  LinearGradient gradiente1() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.0, 0.15, 0.5, 0.8],
      colors: [
      Color.fromRGBO(71, 112, 227, 1),
      Color.fromRGBO(117, 171, 246, 1),
      Color.fromRGBO(74, 114, 228, 1),
      Color.fromRGBO(62, 47, 159, 1)
      ],
    );
  }
}