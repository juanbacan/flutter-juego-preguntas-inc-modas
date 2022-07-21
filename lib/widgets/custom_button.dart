
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String texto;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.texto,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 2000),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(89, 150, 250, 1),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color:const Color.fromARGB(255, 47, 35, 122).withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      
        width: 280,
        height: 50,
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(64, 124, 243, 1),
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                ),
              ),
              Center(
                child:Text(
                  texto, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22, fontFamily: "Coiny")
                )
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
@override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/8, size.height - 40, size.width*1/4, size.height-20);
    path.quadraticBezierTo(3/8*size.width, size.height, size.width*1/2, size.height-30);
    path.quadraticBezierTo(size.width*5/8, size.height - 40, size.width*3/4, size.height-20);
    path.quadraticBezierTo(7/8*size.width, size.height, size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
